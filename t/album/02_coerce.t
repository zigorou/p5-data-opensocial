use strict;
use Test::More;

use Data::OpenSocial::Album;

plan tests => 7 * 1;

{
    package Test::Data::OpenSocial::Album::IsaType;

    use Any::Moose;
    use Data::OpenSocial::Types qw(OpenSocial.Album);

    has 'data' => (
        is     => 'rw',
        isa    => 'OpenSocial.Album',
        coerce => 1,
    );

    no Any::Moose;

    __PACKAGE__->meta->make_immutable;
}

our %defaults = (
    id           => '44332211',
    thumbnail_url => 'http://pages.example.org/albums/4433221-tn.png',
    # caption      => 'Example Album', # spec is wrong?
    description =>
      'This is an example album, and this text is an example description',
    location => +{ latitude => 0, longitude => 0 },
    owner_id  => 'example.org:55443322',
);

{
    my $type_class = Test::Data::OpenSocial::Album::IsaType->new( data => \%defaults );

    my $data = $type_class->data;

    isa_ok($data, 'Data::OpenSocial::Album');

    is($data->id, $defaults{id}, 'id');
    is($data->thumbnail_url, $defaults{thumbnail_url}, 'thumbnail_url');
    is($data->description, $defaults{description}, 'description');
    is($data->location->latitude, $defaults{location}{latitude}, 'location->latitude');
    is($data->location->longitude, $defaults{location}{longitude}, 'location->longitude');
    is($data->owner_id, $defaults{owner_id}, 'owner_id');
}
