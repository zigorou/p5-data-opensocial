package Data::OpenSocial::Response;

use Any::Moose;

extends 'Data::OpenSocial::Base';

do {
    my @element_fields = (
        +{
            namespace => 'http://a9.com/-/spec/opensearch/1.1',
            field     => 'items_per_page',
            is        => 'rw',
            isa       => 'Int',
            default   => 0,
        },
        +{
            namespace => 'http://a9.com/-/spec/opensearch/1.1',
            field     => 'start_index',
            is        => 'rw',
            isa       => 'Int',
            default   => 0,
        },
        +{
            namespace => 'http://a9.com/-/spec/opensearch/1.1',
            field     => 'total_results',
            is        => 'rw',
            isa       => 'Int',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'is_filtered',
            is        => 'rw',
            isa       => 'Bool',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'is_sorted',
            is        => 'rw',
            isa       => 'Bool',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'is_updated_since',
            is        => 'rw',
            isa       => 'Bool',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'group',
            is        => 'rw',
            isa       => 'Group',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'activity',
            is        => 'rw',
            isa       => 'Activity',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'person',
            is        => 'rw',
            isa       => 'Person',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'album',
            is        => 'rw',
            isa       => 'Album',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'media_item',
            is        => 'rw',
            isa       => 'MediaItem',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'message',
            is        => 'rw',
            isa       => 'Message',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'entry',
            is        => 'rw',
            isa       => 'Entry',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'map',
            is        => 'rw',
            isa       => 'Any',
            default   => 0,
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;
