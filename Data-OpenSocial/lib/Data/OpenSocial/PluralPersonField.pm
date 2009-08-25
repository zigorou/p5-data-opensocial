package Data::OpenSocial::PluralPersonField;

use Any::Moose;

extends 'Data::OpenSocial::Base';
with 'Data::OpenSocial::Role::AsObject';

do {
    my @element_fields = (
	+{
	    field => 'value',
	    is => 'rw',
	    isa => 'Str',
	    required => 0,
	    predicate => 'has_value',
	},
	+{
	    field => 'type',
	    is => 'rw',
	    isa => 'Str',
	    required => 0,
	    predicate => 'has_type',
	},
	+{
	    field => 'primary',
	    is => 'rw',
	    isa => 'Bool',
	    required => 0,
	    predicate => 'has_primary',
	}
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while (my ($field, $attr) = each %attrs) {
	has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

__END__
