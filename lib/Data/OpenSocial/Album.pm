package Data::OpenSocial::Album;

use Any::Moose;
use Data::OpenSocial::Types qw(MediaItemType);

extends 'Data::OpenSocial::Base';
with 'Data::OpenSocial::Role::AsObject';

do {
    my @element_fields = (
        +{
            field     => 'id',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_id',
        },
        +{
            field     => 'thumbnail_url',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_thumbnail_url',
        },
        +{
            field     => 'title',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_title',
        },
        +{
            field     => 'description',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_description',
        },
        +{
            field     => 'location',
            is        => 'rw',
            isa       => 'Str',            ### TODO
            required  => 0,
            predicate => 'has_location',
        },
        +{
            field     => 'owner_id',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_owner_id',
        },
        +{
            field     => 'media_type',
            is        => 'rw',
            isa       => 'MediaItemType',
            required  => 0,
            predicate => 'has_media_type',
        },
        +{
            field     => 'media_mime_type',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_media_mime_type',
        },
        +{
            field     => 'media_item_count',
            is        => 'rw',
            isa       => 'Int',
            required  => 0,
            predicate => 'has_media_item_count',
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

