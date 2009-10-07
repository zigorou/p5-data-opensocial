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

sub entry_trigger {
    my $field = shift;
    return sub {
        my $self = shift;
        $self->entry_type($field);
    };
}

sub entry_type_trigger {
    my ($self, $new_val, $old_val) = @_;

    if (defined $old_val) {
        delete $self->{$old_val};
        delete $self->{query_fields}{$old_val};
    }
}

do {
    
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'activity',
            is        => 'rw',
            isa       => 'OpenSocial.Activity',
            coerce    => 1,
            trigger   => entry_trigger('activity'),
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'person',
            is        => 'rw',
            isa       => 'OpenSocial.Person',
            coerce    => 1,
            trigger   => entry_trigger('person'),
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'group',
            is        => 'rw',
            isa       => 'OpenSocial.Group',
            coerce    => 1,
            trigger   => entry_trigger('group'),
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'app_data',
            is        => 'rw',
            isa       => 'OpenSocial.Appdata',
            coerce    => 1,
            trigger   => entry_trigger('app_data'),
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'album',
            is        => 'rw',
            isa       => 'OpenSocial.Album',
            coerce    => 1,
            trigger   => entry_trigger('album'),
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'media_item',
            is        => 'rw',
            isa       => 'OpenSocial.MediaItem',
            coerce    => 1,
            trigger   => entry_trigger('media_item'),
        }
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }

    has 'entry_type' => (
        is      => 'rw',
        isa     => 'Str',
        trigger => \&entry_type_trigger,
    );
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;
