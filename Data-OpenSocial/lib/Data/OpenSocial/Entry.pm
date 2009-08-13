package Data::OpenSocial::Entry;

use Any::Moose;

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

has 'group' => (
    is	      => 'rw',
    isa	      => 'Group',
    default   => 0,
    predicate => 'has_group',
);

has 'app_data' => (
    is	      => 'rw',
    isa	      => 'Appdata',
    default   => 0,
    predicate => 'has_app_data',
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

no Any::Moose;

__PACKAGE__->meta->make_immutable;
