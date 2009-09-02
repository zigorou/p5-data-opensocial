use strict;
use Test::More;

use Data::OpenSocial::MediaItem;

plan tests => 7 * 1;

{
    package Test::Data::OpenSocial::MediaItem::IsaType;

    use Any::Moose;
    use Data::OpenSocial::Types qw(OpenSocial.MediaItem);

    has 'data' => (
        is     => 'rw',
        isa    => 'OpenSocial.MediaItem',
        coerce => 1,
    );

    no Any::Moose;

    __PACKAGE__->meta->make_immutable;
}

our %defaults = (
    id            => '11223344',
    thumbnail_url => 'http://pages.example.org/images/11223344-tn.png',
    mime_type     => 'image/png',
    type          => 'IMAGE',
    url           => 'http://pages.example.org/images/11223344.png',
    album_id      => '44332211',
);

{
    my $type_class = Test::Data::OpenSocial::MediaItem::IsaType->new( data => \%defaults );

    my $data = $type_class->data;

    isa_ok($data, 'Data::OpenSocial::MediaItem');

    is($data->id, $defaults{id}, 'id');
    is($data->thumbnail_url, $defaults{thumbnail_url}, 'thumbnail_url');
    is($data->mime_type, $defaults{mime_type}, 'mime_type');
    is($data->type, $defaults{type}, 'type');
    is($data->url, $defaults{url}, 'url');
    is($data->album_id, $defaults{album_id}, 'album_id');
}
