package Data::OpenSocial::AppdataEntry;

use Any::Moose;

has 'key' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 1,
    predicate => 'has_key',
);

has 'value' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 1,
    predicate => 'has_value',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;


