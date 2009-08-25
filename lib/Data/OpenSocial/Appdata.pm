package Data::OpenSocial::Appdata;

use Any::Moose;

extends 'Data::OpenSocial::Base';
with 'Data::OpenSocial::Role::AsObject';

do {
    my @element_fields = (
	+{
	    field     => 'entry',
	    is	      => 'rw',
	    isa	      => 'ArrayRef[Any]', ### TODO
	    required  => 0,
	    predicate => 'has_entry',
	},
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while (my ($field, $attr) = each %attrs) {
	has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;


