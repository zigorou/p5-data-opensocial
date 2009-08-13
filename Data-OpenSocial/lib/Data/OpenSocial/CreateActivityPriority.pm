package Data::OpenSocial::CreateActivityPriorityType;

use Any::Moose;
use Data::OpenSocial::Types qw(CreateActivityPriorityTypeType);

with 'Data::OpenSocial::Role::AsObject';

has 'display_value' => (
    is => 'rw',
    isa => 'Str',
    required => 0,
    predicate => 'has_display_value',
);

has 'value' => (
    is => 'rw',
    isa => 'CreateActivityPriorityTypeType',
    required => 0,
    predicate => 'has_value',
);

sub elements_map {
    +{ display_value => 'displayValue' };
}

sub element_fields {
    qw(display_value value);
}

no Any::Moose;

__PACKAGE__->meta->make_immutable;

