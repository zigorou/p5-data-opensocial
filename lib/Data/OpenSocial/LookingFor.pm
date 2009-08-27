package Data::OpenSocial::LookingFor;

use Any::Moose;
use Data::OpenSocial::Types qw(OpenSocial.LookingForType);

extends 'Data::OpenSocial::Base';

do {
    my @element_fields = (
        +{
            field     => 'display_value',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_display_value',
        },
        +{
            field    => 'value',
            is       => 'rw',
            isa      => 'OpenSocial.LookingForType',
            required => 0,
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

