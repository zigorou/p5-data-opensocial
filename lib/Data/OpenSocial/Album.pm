package Data::OpenSocial::Album;

use Any::Moose;
use Data::OpenSocial::Types qw(
  OpenSocial.Address
  OpenSocial.MediaItemType
);

extends 'Data::OpenSocial::Base';

do {
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'id',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'thumbnail_url',
            typemap   => 'thumbnailUrl',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'title',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'description',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'location',
            is        => 'rw',
            isa       => 'OpenSocial.Address',
            required  => 0,
            coerce    => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'owner_id',
            typemap   => 'ownerId',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'media_type',
            typemap   => 'mediaType',
            is        => 'rw',
            isa       => 'OpenSocial.MediaItemType',
            required  => 0,
            coerce    => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'media_mime_type',
            typemap   => 'mediaMimeType',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'media_item_count',
            typemap   => 'mediaItemCount',
            is        => 'rw',
            isa       => 'Int',
            required  => 0,
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

