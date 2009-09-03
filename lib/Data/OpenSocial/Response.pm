package Data::OpenSocial::Response;

use Any::Moose;

extends 'Data::OpenSocial::Base';

use Data::OpenSocial::Types qw(
  OpenSocial.Activity
  OpenSocial.Album
  OpenSocial.Appdata
  OpenSocial.Group
  OpenSocial.MediaItem
  OpenSocial.Person
  OpenSocial.Entry
  OpenSocial.Entry.Collection
);

do {
    my @element_fields = (
        +{
            namespace => 'http://a9.com/-/spec/opensearch/1.1',
            field     => 'items_per_page',
            is        => 'rw',
            isa       => 'Int',
        },
        +{
            namespace => 'http://a9.com/-/spec/opensearch/1.1',
            field     => 'start_index',
            is        => 'rw',
            isa       => 'Int',
        },
        +{
            namespace => 'http://a9.com/-/spec/opensearch/1.1',
            field     => 'total_results',
            is        => 'rw',
            isa       => 'Int',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'is_filtered',
            is        => 'rw',
            isa       => 'Bool',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'is_sorted',
            is        => 'rw',
            isa       => 'Bool',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'is_updated_since',
            is        => 'rw',
            isa       => 'Bool',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'group',
            is        => 'rw',
            isa       => 'OpenSocial.Group',
            coerce    => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'activity',
            is        => 'rw',
            isa       => 'OpenSocial.Activity',
            coerce    => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'person',
            is        => 'rw',
            isa       => 'OpenSocial.Person',
            coerce    => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'album',
            is        => 'rw',
            isa       => 'OpenSocial.Album',
            coerce    => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'media_item',
            is        => 'rw',
            isa       => 'OpenSocial.MediaItem',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'message',
            is        => 'rw',
            isa       => 'OpenSocial.Message',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'entry',
            is        => 'rw',
            isa       => 'OpenSocial.Entry.Collection',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'map',
            is        => 'rw',
            isa       => 'Any',
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;
