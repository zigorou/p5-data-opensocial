package Data::OpenSocial::Activity;

use Any::Moose;

extends 'Data::OpenSocial::Base';
with 'Data::OpenSocial::Role::AsObject';

do {
    my @element_fields = (
        +{
            field     => 'app_id',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
            predicate => 'has_app_id',
        },
        +{
            field     => 'body',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
            predicate => 'has_body',
        },
        +{
            field     => 'body_id',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
            predicate => 'has_body_id',
        },
        +{
            field     => 'external_id',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
            predicate => 'has_external_id',
        },
        +{
            field     => 'id',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
            predicate => 'has_id',
        },
        +{
            field     => 'media_items',
            is        => 'rw',
            isa       => 'MediaItem',
            default   => 0,
            predicate => 'has_media_items',
        },
        +{
            field     => 'posted_time',
            is        => 'rw',
            isa       => 'Int',
            default   => 0,
            predicate => 'has_posted_time',
        },
        +{
            field     => 'priority',
            is        => 'rw',
            isa       => 'Int',
            default   => 0,
            predicate => 'has_priority',
        },
        +{
            field     => 'stream_favicon_url',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
            predicate => 'has_stream_favicon_url',
        },
        +{
            field     => 'stream_source_url',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
            predicate => 'has_stream_source_url',
        },
        +{
            field     => 'stream_title',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
            predicate => 'has_stream_title',
        },
        +{
            field     => 'stream_url',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
            predicate => 'has_stream_url',
        },
        +{
            field     => 'template_params',
            is        => 'rw',
            isa       => 'ActivityTemplateParams',
            default   => 0,
            predicate => 'has_template_params',
        },
        +{
            field     => 'title',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
            predicate => 'has_title',
        },
        +{
            field     => 'title_id',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
            predicate => 'has_title_id',
        },
        +{
            field     => 'url',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
            predicate => 'has_url',
        },
        +{
            field     => 'user_id',
            is        => 'rw',
            isa       => 'Str',
            default   => 0,
            predicate => 'has_user_id',
        },
    );

    __PACKAGE__->setup(@element_fields);

    for (@element_fields) {
        my $field = delete $_->{field};
        delete $_->{typemap};
        has $field => %$_;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

