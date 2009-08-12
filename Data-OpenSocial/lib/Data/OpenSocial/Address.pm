package Data::OpenSocial::Address;

use Any::Moose;

has 'country' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_country',
);

has 'extended_address' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_extended_address',
);

has 'latitude' => (
    is	      => 'rw',
    isa	      => 'Int',
    required  => 0,
    predicate => 'has_latitude',
);

has 'locality' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_locality',
);

has 'longitude' => (
    is	      => 'rw',
    isa	      => 'Int',
    required  => 0,
    predicate => 'has_longitude',
);

has 'po_box' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_po_box',
);

has 'postal_code' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_postal_code',
);

has 'primary' => (
    is	      => 'rw',
    isa	      => 'Bool',
    required  => 0,
    predicate => 'has_primary',
);

has 'region' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_region',
);

has 'street_address' => (
    is	      => 'rw',
    isa	      => 'Bool',
    required  => 0,
    predicate => 'has_street_address',
);

has 'type' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_type',
);

has 'formatted' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_formatted',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;


