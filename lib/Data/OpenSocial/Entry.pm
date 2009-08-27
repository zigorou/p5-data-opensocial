package Data::OpenSocial::Entry;

use Any::Moose;

extends 'Data::OpenSocial::Base';

do {
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'activity',
            is        => 'rw',
            isa       => 'Activity',
            default   => 0,
            predicate => 'has_activity',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'person',
            is        => 'rw',
            isa       => 'Person',
            default   => 0,
            predicate => 'has_person',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'group',
            is        => 'rw',
            isa       => 'Group',
            default   => 0,
            predicate => 'has_group',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'app_data',
            is        => 'rw',
            isa       => 'Appdata',
            default   => 0,
            predicate => 'has_app_data',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'album',
            is        => 'rw',
            isa       => 'Album',
            default   => 0,
            predicate => 'has_album',
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'media_item',
            is        => 'rw',
            isa       => 'MediaItem',
            default   => 0,
            predicate => 'has_media_item',
        }
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;
