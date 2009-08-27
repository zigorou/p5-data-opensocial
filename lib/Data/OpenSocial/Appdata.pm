package Data::OpenSocial::Appdata;

use Any::Moose;

use Data::OpenSocial::Types qw(
  OpenSocial.AppdataEntry
);

extends 'Data::OpenSocial::Base';

do {
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'entry',
            is        => 'rw',
            isa       => 'ArrayRef[OpenSocial.AppdataEntry]',
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

