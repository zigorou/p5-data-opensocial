package Data::OpenSocial::Url;

use Any::Moose;

has 'value' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_value',
);

has 'link_text' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_link_text',
);

has 'type' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_type',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;


