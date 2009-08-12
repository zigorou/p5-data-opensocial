package Data::OpenSocial::Name;

use Any::Moose;

has 'additional_name' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_additional_name',
);

has 'family_name' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_family_name',
);

has 'given_name' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_given_name',
);

has 'honorific_prefix' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_honorific_prefix',
);

has 'honorific_suffix' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_honorific_suffix',
);

has 'formatted' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_formatted',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;


