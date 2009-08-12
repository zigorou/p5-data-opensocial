package Data::OpenSocial::Address;

use Any::Moose;

has 'build' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_build',
);

has 'eye_color' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_color',
);

has 'hair_color' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_hair_color',
);

has 'height' => (
    is	      => 'rw',
    isa	      => 'Int',
    required  => 0,
    predicate => 'has_height',
);

has 'weight' => (
    is	      => 'rw',
    isa	      => 'Int',
    required  => 0,
    predicate => 'has_weight',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;


