package Data::OpenSocial::Format::JSON;

use strict;
use warnings;

use JSON::Any qw(DWIW XS Syck JSON);
use Data::Util qw(is_array_ref is_hash_ref);
use DateTime::Format::ISO8601;
use Module::Load;
use Module::Loaded;

use Data::OpenSocial::Types;

sub format {
    my ( $class, $object ) = @_;

    my $json = JSON::Any->new;
    return $json->to_json( $class->format_object($object) );
}

sub format_object {
    my ( $class, $object ) = @_;

    unless (defined $object) {
        return undef;
    }
    
    my %serialized;

    for my $field ( @{ $object->element_fields } ) {
        my $attr = $object->meta->get_attribute($field);

        my $type         = $attr->type_constraint;
        my $predicate    = $attr->predicate;

        next unless ( $object->$predicate || $object->exists_in_query_fields($field) );
        
        my $element_name = $object->field_to_element($field);

        if (   Data::OpenSocial::Types->is_primitive_type($type)
            || Data::OpenSocial::Types->is_simple_type($type) )
        {
            $serialized{$element_name} = $object->$field;
        }
        elsif ( Data::OpenSocial::Types->is_imported_type($type) ) {
            if ( $type eq 'DateTime' ) {
                $serialized{$element_name} = $object->$field ? $object->$field->iso8601 : undef;
            }
        }
        elsif ( Data::OpenSocial::Types->is_collection_type($type) ) {
            if ( $type eq 'OpenSocial.AppdataEntry.Collection' ) {
                %serialized =
                  ( map { ( $_->key, $_->value ) } @{ $object->entry } );
                return \%serialized;
            }
            else {
                $serialized{$element_name} = [
                    map { $class->format_object( $_ ) }
                    @{$object->$field}
                ];
            }
        }
        else {
            $serialized{$element_name} =
              $class->format_object( $object->$field );
        }
    }

    return \%serialized;
}

sub parse {
    my ( $class, $class_type, $json_str ) = @_;

    if ( substr( $class_type, 0, 1 ) ne '+' ) {
        $class_type = 'Data::OpenSocial::' . $class_type;
    }
    else {
        $class_type =~ s/^\+//;
    }

    my $json = JSON::Any->new;
    my $data = $class->parse_object( $class_type, $json->from_json($json_str) );

    # load $class_type unless (is_loaded $class_type);

    if ( UNIVERSAL::isa( $class_type, 'Data::OpenSocial::Appdata' ) ) {
        my $object = $class_type->new();
        if ( exists $data->{entry} ) {

            # +{ entry: [ { "key": "pokes", "value": 3 },
            # { "key": "last_poke", "value": "2008-02-13T18:30:02Z" } ] }
            $object->entry( [ @{ $data->{entry} } ] );
        }
        else {

            # +{ "pokes": 3, "last_poke": "2008-02-13T18:30:02Z" }
            $object->entry($data);
        }

        return $object;
    }
    else {
        my $object = $class_type->new($data);
        return $object;
    }
}

sub parse_object {
    my ( $class, $class_type, $object ) = @_;

    if ( UNIVERSAL::isa( $class_type, 'Data::OpenSocial::Appdata' )
        && !exists $object->{entry} )
    {
        $object->{entry} = [];
        for ( keys %$object ) {
            push(
                @{ $object->{entry} },
                +{ key => $_, value => $object->{$_} }
            );
            delete $object->{$_};
        }
    }

    load $class_type unless (is_loaded($class_type));
    
    my %data;
    $data{query_fields} = +{ map { $_ => 1 } keys %$object };
    
    for my $element ( keys %$object ) {
        my $field = $class_type->element_to_field($element);
        
        unless ($field) {
            $data{$element} = $object->{$element};
            next;
        }

        next unless (defined $object->{$element});
        
        $data{$field} = $object->{$element};

        my $type = $class_type->meta->get_attribute($field)->type_constraint;

        if ( is_hash_ref( $data{$field} ) ) {
            $data{$field} =
              $class->parse_object(
                $Data::OpenSocial::Types::COMPLEX_TYPES{$type}{class_type},
                $data{$field} );
        }
        elsif ( is_array_ref( $data{$field} ) ) {
            if (exists $Data::OpenSocial::Types::COLLECTION_TYPES{$type}{item_class}) {
                $data{$field} = [
                    map {
                        $class->parse_object(
                            $Data::OpenSocial::Types::COLLECTION_TYPES{$type}{item_class},
                            $_
                        )
                    }
                    @{$data{$field}}
                ];
            }
        }
    }

    return \%data;
}

1;

__END__
