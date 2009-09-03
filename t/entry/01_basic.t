use strict;
use Test::More;

use Data::OpenSocial::Entry;

diag('entry data basic testing');

{
    my $src = +{
        id =>
'http://example.org/activities/example.org:87ead8dead6beef/self/af3778',
        title   => '<a href="foo">some activity</a>',
        updated => '2008-02-20T23:35:37',
        body    => 'Some details for some activity',
        body_id => '383777272',
        url     => 'http://api.example.org/activity/feeds/.../af3778',
        user_id => 'example.org:34KJDCSKJN2HHF0DW20394',
    };

    my $data = Data::OpenSocial::Entry->new( activity => $src );
    isa_ok( $data, 'Data::OpenSocial::Entry' );

    my $dst = $data->activity;
    isa_ok( $dst, 'Data::OpenSocial::Activity' );

    is( $dst->id,    $src->{id},    '//entry/activity/id' );
    is( $dst->title, $src->{title}, '//entry/activity/title' );
    isa_ok( $dst->updated, 'DateTime' );
    is( $dst->updated->year,  2008, '//entry/activity/updated (year)' );
    is( $dst->updated->month, 2,    '//entry/activity/updated (month)' );
    is( $dst->updated->day,   20,   '//entry/activity/updated (day)' );
    is( $dst->body,    $src->{body},    '//entry/activity/body' );
    is( $dst->body_id, $src->{body_id}, '//entry/activity/bodyId' );
    is( $dst->url,     $src->{url},     '//entry/activity/url' );
    is( $dst->user_id, $src->{user_id}, '//entry/activity/userId' );
}

{
    my $src = +{
        id           => 'example.org:34KJDCSKJN2HHF0DW20394',
        display_name => "Janey",
        name         => +{ formatted => 'Jane Doe' },
        gender       => 'female',
    };

    my $data = Data::OpenSocial::Entry->new( person => $src );
    isa_ok( $data, 'Data::OpenSocial::Entry' );

    my $dst = $data->person;
    isa_ok( $dst, 'Data::OpenSocial::Person' );

    is( $dst->id, $src->{id}, '//entry/person/id' );
    is( $dst->display_name, $src->{display_name},
        '//entry/person/displayName' );
    is(
        $dst->name->formatted,
        $src->{name}{formatted},
        '//entry/person/name/formatted'
    );
    is( $dst->gender, $src->{gender}, '//entry/person/gender' );
}

{
    my $src = +{
        id    => 'example.org:34KJDCSKJN2HHF0DW20394/friends',
        title => 'Peeps',
    };

    my $data = Data::OpenSocial::Entry->new( group => $src );
    isa_ok( $data, 'Data::OpenSocial::Entry' );

    my $dst = $data->group;
    isa_ok( $dst, 'Data::OpenSocial::Group' );

    is( $dst->id,    $src->{id},    '//entry/group/id' );
    is( $dst->title, $src->{title}, '//entry/group/title' );
}

{
    my $src = +{
        pokes     => 3,
        last_poke => '2008-02-13T18:30:02Z',
    };

    my $data = Data::OpenSocial::Entry->new( app_data => $src );
    isa_ok( $data, 'Data::OpenSocial::Entry' );

    my $dst = $data->app_data;
    isa_ok( $dst, 'Data::OpenSocial::Appdata' );

    is( $dst->entry->[0]->key, 'last_poke', '//entry/appdata/entry[0]/key' );
    is( $dst->entry->[0]->value,
        '2008-02-13T18:30:02Z', '//entry/appdata/entry[0]/value' );
    is( $dst->entry->[1]->key,   'pokes', '//entry/appdata/entry[1]/key' );
    is( $dst->entry->[1]->value, 3,       '//entry/appdata/entry[1]/value' );
}

{
    my $src = +{
        id            => '44332211',
        thumbnail_url => 'http://pages.example.org/albums/4433221-tn.png',

        # caption      => 'Example Album', # spec is wrong?
        description =>
          'This is an example album, and this text is an example description',
        location => +{ latitude => 0, longitude => 0 },
        owner_id => 'example.org:55443322',
    };

    my $data = Data::OpenSocial::Entry->new( album => $src );
    isa_ok( $data, 'Data::OpenSocial::Entry' );

    my $dst = $data->album;
    isa_ok( $dst, 'Data::OpenSocial::Album' );

    is( $dst->id, $src->{id}, '//entry/album/id' );
    is( $dst->thumbnail_url, $src->{thumbnail_url},
        '//entry/album/thumbnailUrl' );
    is( $dst->description, $src->{description}, '//entry/album/description' );
    is(
        $dst->location->latitude,
        $src->{location}{latitude},
        '//entry/album/location/latitude'
    );
    is(
        $dst->location->longitude,
        $src->{location}{longitude},
        '//entry/album/location/longitude'
    );
    is( $dst->owner_id, $src->{owner_id}, '//entry/album/owner_id' );
}

{
    my $src = +{
        id            => '11223344',
        thumbnail_url => 'http://pages.example.org/images/11223344-tn.png',
        mime_type     => 'image/png',
        type          => 'IMAGE',
        url           => 'http://pages.example.org/images/11223344.png',
        album_id      => '44332211',
    };

    my $data = Data::OpenSocial::Entry->new( media_item => $src );
    isa_ok( $data, 'Data::OpenSocial::Entry' );

    my $dst = $data->media_item;
    isa_ok( $dst, 'Data::OpenSocial::MediaItem' );

    is( $dst->id, $src->{id}, '//entry/mediaItem/id' );
    is( $dst->thumbnail_url, $src->{thumbnail_url},
        '//entry/mediaItem/thumbnailUrl' );
    is( $dst->mime_type, $src->{mime_type}, '//entry/mediaItem/mimeType' );
    is( $dst->type,      $src->{type},      '//entry/mediaItem/type' );
    is( $dst->url,       $src->{url},       '//entry/mediaItem/url' );
    is( $dst->album_id,  $src->{album_id},  '//entry/mediaItem/albumId' );
}

done_testing();
