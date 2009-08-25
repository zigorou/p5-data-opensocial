package Data::OpenSocial::Group;

use Any::Moose;

has 'id' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_id',
);

has 'title' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_title',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;


