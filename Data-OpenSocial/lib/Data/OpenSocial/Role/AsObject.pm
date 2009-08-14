package Data::OpenSocial::Role::AsObject;

use Any::Moose '::Role';

use DateTime::Format::XSD;
use Data::OpenSocial::Types;

use Perl6::Say;
use Data::Dump qw(dump);

requires 'element_to_field';
requires 'field_to_element';
requires 'element_fields';

sub as_object {
    my $self = shift;

    my $obj = +{};
    
    for my $field ($self->element_fields) {
	my $attr = $self->meta->get_attribute($field);

	my $type         = $attr->type_constraint;
	my $predicate    = $attr->predicate;
	my $element_name = $self->field_to_element($field);

	next unless ($self->$predicate);
	
	if (Data::OpenSocial::Types->is_primitive_type($type) || Data::OpenSocial::Types->is_simple_type($type)) {
	    $obj->{$element_name} = $self->$field;
	}
	elsif (Data::OpenSocial::Types->is_imported_type($type)) {
	    if ($type eq 'DateTime') {
		$obj->{$element_name} = DateTime::Format::XSD->format_datetime($self->$field);
	    }
	}
	elsif ($type =~ m#ArrayRef\[([^\[\]]+)\]$#) {
	    my $subtype = $1;

	    my $data = [];
	    for my $item (@{$self->$field}) {
		if (Data::OpenSocial::Types->is_primitive_type($type) || Data::OpenSocial::Types->is_simple_type($type)) {
		    push(@$data, $item);
		}
		elsif (Data::OpenSocial::Types->is_imported_type($type)) {
		    if ($type eq 'DateTime') {
			push(@$data, DateTime::Format::XSD->format_datetime($self->$field));
		    }
		}
		else {
		    push(@$data, $item->as_object);
		}
		$obj->{$element_name} = $data;
	    }
	}
	else {
	    $obj->{$element_name} = $self->$field->as_object;
	}
    }

    return $obj;
}

no Any::Moose '::Role';

1;

