package Data::OpenSocial::MediaItem;

use Any::Moose;
use Data::OpenSocial::Types qw(Datetime MediaItemType);

has 'id' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_id',
);

has 'title' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_title',
);

has 'created' => (
    is	      => 'rw',
    isa	      => 'Datetime',
    required  => 0,
    predicate => 'has_created',
);

has 'thumbnail_url' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_thumbnail_url',
);

has 'description' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_description',
);

has 'duration' => (
    is	      => 'rw',
    isa	      => 'Int',
    required  => 0,
    predicate => 'has_duration',
);

has 'location' => (
    is	      => 'rw',
    isa	      => 'Str', ### TODO
    required  => 0,
    predicate => 'has_location',
);

has 'language' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_language',
);

has 'album_id' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_album_id',
);

has 'file_size' => (
    is	      => 'rw',
    isa	      => 'Int',
    required  => 0,
    predicate => 'has_language',
);

has 'start_time' => (
    is	      => 'rw',
    isa	      => 'Datetime',
    required  => 0,
    predicate => 'has_start_time',
);

has 'rating' => (
    is => 'rw',
    isa => 'Int',
    required => 0,
    predicate => 'has_rating',
);

has 'num_votes' => (
    is => 'rw',
    isa => 'Int',
    required => 0,
    predicate => 'has_num_votes',
);

has 'num_comments' => (
    is => 'rw',
    isa => 'Int',
    required => 0,
    predicate => 'has_num_comments',
);

has 'num_views' => (
    is => 'rw',
    isa => 'Int',
    required => 0,
    predicate => 'has_num_views',
);

has 'tags' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_tags',
);

has 'tagged_people' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_tagged_people',
);

has 'mime_type' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_mime_type',
);

has 'type' => (
    is	      => 'rw',
    isa	      => 'Str', ### TODO
    required  => 0,
    predicate => 'has_type',
);

has 'url' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_url',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;

