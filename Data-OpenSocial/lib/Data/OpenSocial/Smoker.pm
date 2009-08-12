package Data::OpenSocial::SmokerType;

use Any::Moose;
use Data::OpenSocial::Types qw(SmokerTypeType);

has 'display_value' => (
    is => 'rw',
    isa => 'Str',
    required => 0,
    predicate => 'has_display_value',
);

has 'value' => (
    is => 'rw',
    isa => 'SmokerTypeType',
    required => 0,
    predicate => 'has_value',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;

