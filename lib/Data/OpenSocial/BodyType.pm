package Data::OpenSocial::BodyType;

use Any::Moose;

extends 'Data::OpenSocial::Base';

do {
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'build',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_build',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'eye_color',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_color',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'hair_color',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_hair_color',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'height',
            is        => 'rw',
            isa       => 'Int',
            required  => 0,
            predicate => 'has_height',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'weight',
            is        => 'rw',
            isa       => 'Int',
            required  => 0,
            predicate => 'has_weight',
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

