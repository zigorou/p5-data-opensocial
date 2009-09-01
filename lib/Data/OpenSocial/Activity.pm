package Data::OpenSocial::Activity;

use Any::Moose;
use Any::Moose 'X::Types::DateTime';

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
            typemap   => 'appId',
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
            typemap   => 'bodyId',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'external_id',
            typemap   => 'externalId',
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
            typemap   => 'mediaItems',
            is        => 'rw',
            isa       => 'ArrayRef[OpenSocial.MediaItem]',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'posted_time',
            typemap   => 'postedTime',
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
            typemap   => 'streamFaviconUrl',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'stream_source_url',
            typemap   => 'streamSourceUrl',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'stream_title',
            typemap   => 'streamTitle',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'stream_url',
            typemap   => 'streamUrl',
            is        => 'rw',
            isa       => 'Str',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'template_params',
            typemap   => 'templateParams',
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
            typemap   => 'titleId',
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
            typemap   => 'userId',
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

