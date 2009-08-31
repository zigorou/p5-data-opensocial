package Data::OpenSocial::Appdata;

use Any::Moose;
use Any::Moose 'X::AttributeHelpers';

use Data::OpenSocial::Types qw(
  OpenSocial.AppdataEntry
  OpenSocial.AppdataEntry.Collection
);

extends 'Data::OpenSocial::Base';

do {
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'entry',
            metaclass => 'Collection::List',
            provides  => +{ count => 'count_entry' },
            is        => 'rw',
            isa       => 'OpenSocial.AppdataEntry.Collection',
            required  => 0,
            coerce    => 1,
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

