package Data::OpenSocial::NetworkPresence;

use Any::Moose;
use Data::OpenSocial::Types qw(NetworkPresenceType);

has 'display_value' => (
    is => 'rw',
    isa => 'Str',
    required => 0,
    predicate => 'has_display_value',
);

has 'value' => (
    is => 'rw',
    isa => 'NetworkPresenceType',
    required => 0,
    predicate => 'has_value',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;

