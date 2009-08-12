package Data::OpenSocial::Organization;

use Any::Moose;
use Data::OpenSocial::Types qw(Datetime);

has 'address' => (
    is	      => 'rw',
    isa	      => 'Str', ### TODO
    required  => 0,
    predicate => 'has_address',
);

has 'department' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_department',
);

has 'description' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_description',
);

has 'end_date' => (
    is	      => 'rw',
    isa	      => 'Datetime',
    required  => 0,
    predicate => 'has_end_date',
);

has 'name' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_name',
);

has 'start_date' => (
    is	      => 'rw',
    isa	      => 'Datetime',
    required  => 0,
    predicate => 'has_start_date',
);

has 'type' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_type',
);

has 'title' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_title',
);

has 'field' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_field',
);

has 'sub_field' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_sub_field',
);

has 'webpage' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_webpage',
);

has 'salary' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_saraly',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;


