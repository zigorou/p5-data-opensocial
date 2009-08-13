package Data::OpenSocial::ActivityTemplateParams;

use Any::Moose;

has 'person_key' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_additional_name',
);

has 'person_key_display_name' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_family_name',
);

has 'person_key_id' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_given_name',
);

has 'person' => (
    is	      => 'rw',
    isa	      => 'Str', ### TODO
    required  => 0,
    predicate => 'has_person',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;


