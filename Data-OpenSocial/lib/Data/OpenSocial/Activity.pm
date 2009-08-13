package Data::OpenSocial::Activity;

use Any::Moose;

has 'app_id' => (
    is	      => 'rw',
    isa	      => 'Str',
    default   => 0,
    predicate => 'has_app_id',
);

has 'body' => (
    is	      => 'rw',
    isa	      => 'Str',
    default   => 0,
    predicate => 'has_body',
);

has 'body_id' => (
    is	      => 'rw',
    isa	      => 'Str',
    default   => 0,
    predicate => 'has_body_id',
);

has 'external_id' => (
    is	      => 'rw',
    isa	      => 'Str',
    default   => 0,
    predicate => 'has_external_id',
);

has 'id' => (
    is	      => 'rw',
    isa	      => 'Str',
    default   => 0,
    predicate => 'has_id',
);

has 'media_items' => (
    is	      => 'rw',
    isa	      => 'MediaItem',
    default   => 0,
    predicate => 'has_media_items',
);

has 'posted_time' => (
    is	      => 'rw',
    isa	      => 'Int',
    default   => 0,
    predicate => 'has_posted_time',
);

has 'priority' => (
    is	      => 'rw',
    isa	      => 'Int',
    default   => 0,
    predicate => 'has_priority',
);

has 'stream_favicon_url' => (
    is	      => 'rw',
    isa	      => 'Str',
    default   => 0,
    predicate => 'has_stream_favicon_url',
);

has 'stream_source_url' => (
    is	      => 'rw',
    isa	      => 'Str',
    default   => 0,
    predicate => 'has_stream_source_url',
);

has 'stream_title' => (
    is	      => 'rw',
    isa	      => 'Str',
    default   => 0,
    predicate => 'has_stream_title',
);

has 'stream_url' => (
    is	      => 'rw',
    isa	      => 'Str',
    default   => 0,
    predicate => 'has_stream_url',
);

has 'template_params' => (
    is	      => 'rw',
    isa	      => 'ActivityTemplateParams',
    default   => 0,
    predicate => 'has_template_params',
);

has 'title' => (
    is	      => 'rw',
    isa	      => 'Str',
    default   => 0,
    predicate => 'has_title',
);

has 'title_id' => (
    is	      => 'rw',
    isa	      => 'Str',
    default   => 0,
    predicate => 'has_title_id',
);

has 'url' => (
    is	      => 'rw',
    isa	      => 'Str',
    default   => 0,
    predicate => 'has_url',
);

has 'user_id' => (
    is	      => 'rw',
    isa	      => 'Str',
    default   => 0,
    predicate => 'has_user_id',
);


no Any::Moose;

__PACKAGE__->meta->make_immutable;


