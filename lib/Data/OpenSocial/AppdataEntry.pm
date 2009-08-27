package Data::OpenSocial::AppdataEntry;

use Any::Moose;

extends 'Data::OpenSocial::Base';

do {
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'key',
            is        => 'rw',
            isa       => 'Str',
            required  => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'value',
            is        => 'rw',
            isa       => 'Str',
            required  => 1,
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

