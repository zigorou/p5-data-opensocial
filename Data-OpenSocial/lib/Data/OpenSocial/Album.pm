package Data::OpenSocial::Album;

use Any::Moose;
use Data::OpenSocial::Types qw(MediaItemType);

has 'id' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_id',
);

has 'thumbnail_url' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_thumbnail_url',
);

has 'title' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_title',
);

has 'description' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_description',
);

has 'location' => (
    is	      => 'rw',
    isa	      => 'Str', ### TODO
    required  => 0,
    predicate => 'has_location',
);

has 'owner_id' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_owner_id',
);

has 'media_type' => (
    is	      => 'rw',
    isa	      => 'MediaItemType',
    required  => 0,
    predicate => 'has_media_type',
);

has 'media_mime_type' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
    predicate => 'has_media_mime_type',
);

has 'media_item_count' => (
    is	      => 'rw',
    isa	      => 'Int',
    required  => 0,
    predicate => 'has_media_item_count',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;


