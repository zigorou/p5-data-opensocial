package Data::OpenSocial::Role::AsObject;

use Any::Moose '::Role';
use Data::OpenSocial::Types;

use Perl6::Say;
use Data::Dump qw(dump);

requires 'elements_map';
requires 'element_fields';

our %primitive_type = (
    Str => 1,
    Bool => 1,
    Int => 1,
    Any => 1,
);

sub as_object {
    my $self = shift;

    my $obj = +{};
    
    for my $field ($self->element_fields) {
	my $attr = $self->meta->get_attribute($field);

	my $type         = $attr->type_constraint;
	my $predicate    = $attr->predicate;
	my $element_name = $self->elements_map->{$field} || $field;

	say $type;
	
	next unless ($self->$predicate);
	
	if (exists $primitive_type{$type} || exists $Data::OpenSocial::Types::SIMPLE_TYPES{$type} || $type eq 'DateTime') {
	    $obj->{$element_name} = $self->$field;
	}
    }

    return $obj;
}

no Any::Moose '::Role';

1;

