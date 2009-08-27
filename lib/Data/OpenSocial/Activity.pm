package Data::OpenSocial::Activity;

use Any::Moose;

extends 'Data::OpenSocial::Base';

use Data::OpenSocial::Types qw(
  OpenSocial.MediaItem
  OpenSocial.ActivityTemplateParams
);

do {
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'app_id',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'body',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'body_id',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'external_id',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'id',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'media_items',
            is        => 'rw',
            isa       => 'ArrayRef[OpenSocial.MediaItem]',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'posted_time',
            is        => 'rw',
            isa       => 'Int',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'priority',
            is        => 'rw',
            isa       => 'Int',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'stream_favicon_url',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'stream_source_url',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'stream_title',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'stream_url',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'template_params',
            is        => 'rw',
            isa       => 'OpenSocial.ActivityTemplateParams',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'title',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'title_id',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'url',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'user_id',
            is        => 'rw',
            isa       => 'Str',
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

