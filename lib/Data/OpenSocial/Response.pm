package Data::OpenSocial::Response;

use Any::Moose;

has 'items_per_page' => (
    is	      => 'rw',
    isa	      => 'Int',
    default   => 0,
    predicate => 'has_items_per_page',
);

has 'start_index' => (
    is	      => 'rw',
    isa	      => 'Int',
    default   => 0,
    predicate => 'has_start_index',
);

has 'total_results' => (
    is	      => 'rw',
    isa	      => 'Int',
    default   => 0,
    predicate => 'has_total_results',
);

has 'is_filtered' => (
    is	      => 'rw',
    isa	      => 'Bool',
    default   => 0,
    predicate => 'has_is_filtered',
);

has 'is_sorted' => (
    is	      => 'rw',
    isa	      => 'Bool',
    default   => 0,
    predicate => 'has_is_sorted',
);

has 'is_updated_since' => (
    is	      => 'rw',
    isa	      => 'Bool',
    default   => 0,
    predicate => 'has_is_updated_since',
);

has 'group' => (
    is	      => 'rw',
    isa	      => 'Group',
    default   => 0,
    predicate => 'has_group',
);

has 'activity' => (
    is	      => 'rw',
    isa	      => 'Activity',
    default   => 0,
    predicate => 'has_activity',
);

has 'person' => (
    is	      => 'rw',
    isa	      => 'Person',
    default   => 0,
    predicate => 'has_person',
);

has 'album' => (
    is	      => 'rw',
    isa	      => 'Album',
    default   => 0,
    predicate => 'has_album',
);

has 'media_item' => (
    is	      => 'rw',
    isa	      => 'MediaItem',
    default   => 0,
    predicate => 'has_media_item',
);

has 'message' => (
    is	      => 'rw',
    isa	      => 'Message',
    default   => 0,
    predicate => 'has_message',
);

has 'entry' => (
    is	      => 'rw',
    isa	      => 'Entry',
    default   => 0,
    predicate => 'has_entry',
);

has 'map' => (
    is	      => 'rw',
    isa	      => 'Any',
    default   => 0,
    predicate => 'has_map',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;
