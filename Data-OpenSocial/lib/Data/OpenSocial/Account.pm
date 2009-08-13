package Data::OpenSocial::Account;

use Any::Moose;

has 'domain' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_domain',
);

has 'primary' => (
    is	      => 'rw',
    isa	      => 'Bool',
    required  => 0,
    predicate => 'has_primary',
);

has 'userid' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_userid',
);

has 'username' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_username',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;


