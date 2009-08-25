package Data::OpenSocial::Address;

use Any::Moose;

extends 'Data::OpenSocial::Base';
with 'Data::OpenSocial::Role::AsObject';

do {
    my @element_fields = (
        +{
            field     => 'country',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_country',
        },
        +{
            field     => 'extended_address',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_extended_address',
        },
        +{
            field     => 'latitude',
            is        => 'rw',
            isa       => 'Int',
            required  => 0,
            predicate => 'has_latitude',
        },
        +{
            field     => 'locality',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_locality',
        },
        +{
            field     => 'longitude',
            is        => 'rw',
            isa       => 'Int',
            required  => 0,
            predicate => 'has_longitude',
        },
        +{
            field     => 'po_box',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_po_box',
        },
        +{
            field     => 'postal_code',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_postal_code',
        },
        +{
            field     => 'primary',
            is        => 'rw',
            isa       => 'Bool',
            required  => 0,
            predicate => 'has_primary',
        },
        +{
            field     => 'region',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_region',
        },
        +{
            field     => 'street_address',
            is        => 'rw',
            isa       => 'Bool',
            required  => 0,
            predicate => 'has_street_address',
        },
        +{
            field     => 'type',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_type',
        },
        +{
	    field     => 'formatted',
	    is        => 'rw',
	    isa       => 'Str',
	    required  => 0,
	    predicate => 'has_formatted',
	},
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while (my ($field, $attr) = each %attrs) {
	has $field => %$attr;
    }
};


no Any::Moose;

__PACKAGE__->meta->make_immutable;


