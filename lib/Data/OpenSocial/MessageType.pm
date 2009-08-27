package Data::OpenSocial::MessageType;

use Any::Moose;
use Data::OpenSocial::Types qw(OpenSocial.MessageTypeType);

extends 'Data::OpenSocial::Base';

do {
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'display_value',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_display_value',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'value',
            is        => 'rw',
            isa       => 'MessageTypeType',
            required  => 0,
            predicate => 'has_value',
        }
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

