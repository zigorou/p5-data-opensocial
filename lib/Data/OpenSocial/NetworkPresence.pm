package Data::OpenSocial::NetworkPresence;

use Any::Moose;
use Data::OpenSocial::Types qw(
  OpenSocial.NetworkPresenceType
);

extends 'Data::OpenSocial::Base';

do {
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'display_value',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'value',
            is        => 'rw',
            isa       => 'NetworkPresenceType',
            required  => 0,
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

