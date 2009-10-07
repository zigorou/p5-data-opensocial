package Data::OpenSocial::Format::JSON;

use Any::Moose;

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

    unless ( defined $object ) {
        return undef;
    }

    my %serialized;

    for my $field ( @{ $object->element_fields } ) {
        my $attr      = $class->_find_attribute_by_name($object, $field);
        my $type      = $attr->type_constraint;
        my $predicate = $attr->predicate;

        next
          unless ( $object->$predicate
            || $object->exists_in_query_fields($field) );

        my $element_name = $object->field_to_element($field);

        if (   Data::OpenSocial::Types->is_primitive_type($type)
            || Data::OpenSocial::Types->is_simple_type($type) )
        {
            $serialized{$element_name} = $object->$field;
        }
        elsif ( Data::OpenSocial::Types->is_imported_type($type) ) {
            if ( $type eq 'DateTime' ) {
                $serialized{$element_name} =
                  $object->$field ? $object->$field->iso8601 : undef;
            }
        }
        elsif ( Data::OpenSocial::Types->is_collection_type($type) ) {
            if ( $type eq 'OpenSocial.AppdataEntry.Collection' ) {
                %serialized =
                  ( map { ( $_->key, $_->value ) } @{ $object->entry } );
                return \%serialized;
            }
            else {
                if ( ref $object->$field eq 'ARRAY' ) {
                    $serialized{$element_name} =
                        [ map { $class->format_object($_) } @{ $object->$field } ];
                }
                else {
                    $serialized{$element_name} =
                        $class->format_object($object->$field);
                }
            }
        }
        else {
            $serialized{$element_name} =
              $class->format_object( $object->$field );
        }
    }

    if ($object->isa('Data::OpenSocial::Entry')) {
        return $serialized{$object->field_to_element($object->entry_type)};
    }
    
    return \%serialized;
}

sub parse {
    my ( $class, $class_type, $json_str, $opts ) = @_;

    if ( substr( $class_type, 0, 1 ) ne '+' ) {
        $class_type = 'Data::OpenSocial::' . $class_type;
    }
    else {
        $class_type = substr($class_type, 1);
    }

    my $json = JSON::Any->new;
    my $data = $class->parse_object( $class_type, scalar $json->from_json($json_str), $opts );

    if ( UNIVERSAL::isa( $class_type, 'Data::OpenSocial::Appdata' ) ) {
        my $object = $class_type->new();
        if ( exists $data->{entry} ) {
            if (ref $data->{entry} eq 'ARRAY') {
                # +{ entry: [ { "key": "pokes", "value": 3 },
                $object->entry( [ @{ $data->{entry} } ] );
            }
            else {
                # { "key": "last_poke", "value": "2008-02-13T18:30:02Z" }
                $object->entry($data->{entry});
            }
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
    my ( $class, $class_type, $object, $opts ) = @_;

    load $class_type unless ( is_loaded($class_type) );
    
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
    elsif ( UNIVERSAL::isa($class_type, 'Data::OpenSocial::Entry') && exists $opts->{entry_type} ) {
        ### src : { "pokes": 3, "last_poke": "2008-02-13T18:30:02Z" }
        ### dst : { "app_data": { "pokes": 3, "last_poke": "2008-02-13T18:30:02Z" } }
        $object->{$opts->{entry_type}} = $object;
        delete $opts->{entry_type};
    }
    elsif ( UNIVERSAL::isa($class_type, 'Data::OpenSocial::Response') && exists $object->{entry} && exists $opts->{entry_type} ) {
        $object->{entry} = [ map { +{ $opts->{entry_type} => $_ } } @{$object->{entry}} ];
        delete $opts->{entry_type};
    }
    
    my %data;
    $data{query_fields} = +{
        map { $_ => 1 }
        grep { $_ }
        map  { $class_type->element_to_field($_) } keys %$object
    };

    for my $element ( keys %$object ) {
        my $field = $class_type->element_to_field($element);

        unless ($field) {
            $data{$element} = $object->{$element};
            next;
        }

        next unless ( defined $object->{$element} );

        $data{$field} = $object->{$element};

        my $type = $class->_find_attribute_by_name($class_type, $field)->type_constraint;

        if ( is_hash_ref( $data{$field} ) ) {
            if (
                exists $Data::OpenSocial::Types::COLLECTION_TYPES{$type}
                {item_class} )
            {
                $data{$field} = $class->parse_object(
                    $Data::OpenSocial::Types::COLLECTION_TYPES{$type}
                      {item_class},
                    $data{$field},
                    $opts,
                );
            }
            else {
                $data{$field} = $class->parse_object(
                    $Data::OpenSocial::Types::COMPLEX_TYPES{$type}{class_type},
                    $data{$field},
                    $opts,
                );
            }
        }
        elsif ( is_array_ref( $data{$field} ) ) {
            if (
                exists $Data::OpenSocial::Types::COLLECTION_TYPES{$type}
                {item_class} )
            {
                $data{$field} = [
                    map {
                        $class->parse_object(
                            $Data::OpenSocial::Types::COLLECTION_TYPES{ $type }
                              {item_class},
                            $_,
                            $opts,
                          )
                      } @{ $data{$field} }
                ];
            }
        }
    }

    return \%data;
}

*_find_attribute_by_name = (any_moose eq 'Moose') ?
    sub { $_[1]->meta->find_attribute_by_name($_[2]); } :
    sub {
        my ($class, $object, $name) = @_;
        return $object->meta->get_attribute($name) if ($object->meta->has_attribute($name));
        for my $subclass ($object->meta->superclasses) {
            next unless ($subclass->meta->has_attribute($name));
            return $subclass->meta->get_attribute($name);
        }
    };

no Any::Moose;

__PACKAGE__->meta->make_immutable;

__END__
