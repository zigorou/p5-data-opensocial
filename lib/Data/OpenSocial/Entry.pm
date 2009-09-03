package Data::OpenSocial::Entry;

use Any::Moose;

use Data::OpenSocial::Types qw(
  OpenSocial.Activity
  OpenSocial.Album
  OpenSocial.Appdata
  OpenSocial.Group
  OpenSocial.MediaItem
  OpenSocial.Person
);

extends 'Data::OpenSocial::Base';

do {
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'activity',
            is        => 'rw',
            isa       => 'OpenSocial.Activity',
            coerce    => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'person',
            is        => 'rw',
            isa       => 'OpenSocial.Person',
            coerce    => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'group',
            is        => 'rw',
            isa       => 'OpenSocial.Group',
            coerce    => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'app_data',
            is        => 'rw',
            isa       => 'OpenSocial.Appdata',
            coerce    => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'album',
            is        => 'rw',
            isa       => 'OpenSocial.Album',
            coerce    => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'media_item',
            is        => 'rw',
            isa       => 'OpenSocial.MediaItem',
            coerce    => 1,
        }
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;
