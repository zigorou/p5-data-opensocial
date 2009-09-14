package Data::OpenSocial::Activity;

use Any::Moose;
use Any::Moose 'X::Types::DateTime';

extends 'Data::OpenSocial::Base';

use Data::OpenSocial::Types qw(
  OpenSocial.MediaItem
  OpenSocial.MediaItem.Collection
  OpenSocial.ActivityTemplateParams
);

do {
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'app_id',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'body',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'body_id',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'external_id',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'id',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'media_items',
            is        => 'rw',
            isa       => 'OpenSocial.MediaItem.Collection',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'posted_time',
            is        => 'rw',
            isa       => 'Int',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'priority',
            is        => 'rw',
            isa       => 'Int',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'stream_favicon_url',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'stream_source_url',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'stream_title',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'stream_url',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'template_params',
            is        => 'rw',
            isa       => 'OpenSocial.ActivityTemplateParams',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'title',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'title_id',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'url',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'user_id',
            is        => 'rw',
            isa       => 'Str',
        },
        +{    ### specs wrong?
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'updated',
            is        => 'rw',
            isa       => 'DateTime',
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

