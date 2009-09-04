use strict;
use Test::More;

use Data::OpenSocial::Response;

diag('response data basic testing');

{
    my $src = +{
        start_index => 1,
        items_per_page => 10,
        total_results => 100,
        entry => [
            +{
                activity => +{
                    id =>
                        'http://example.org/activities/example.org:87ead8dead6beef/self/af3778',
                    title   => '<a href="foo">some activity</a>',
                    updated => '2008-02-20T23:35:37',
                    body    => 'Some details for some activity',
                    body_id => '383777272',
                    url     => 'http://api.example.org/activity/feeds/.../af3778',
                    user_id => 'example.org:34KJDCSKJN2HHF0DW20394',
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Response->new( $src );
    isa_ok( $data, 'Data::OpenSocial::Response' );

    is($data->start_index, $src->{start_index}, '//response/startIndex');
    is($data->items_per_page, $src->{items_per_page}, '//response/itemsPerPage');
    is($data->total_results, $src->{total_results}, '//response/totalResults');

    my $activity = $data->entry->[0]->activity;
    
    isa_ok($activity, 'Data::OpenSocial::Activity');
    is($activity->id, $src->{entry}[0]{activity}{id}, '//response/entry[0]/person/id');
    is($activity->title, $src->{entry}[0]{activity}{title}, '//response/entry[0]/person/title');
    isa_ok($activity->updated, 'DateTime');
    is($activity->body, $src->{entry}[0]{activity}{body}, '//response/entry[0]/person/body');
    is($activity->body_id, $src->{entry}[0]{activity}{body_id}, '//response/entry[0]/person/bodyId');
    is($activity->url, $src->{entry}[0]{activity}{url}, '//response/entry[0]/person/url');
}

{
    my $src = +{
        start_index => 1,
        items_per_page => 10,
        total_results => 100,
        activity => +{
            id =>
                'http://example.org/activities/example.org:87ead8dead6beef/self/af3778',
            title   => '<a href="foo">some activity</a>',
            updated => '2008-02-20T23:35:37',
            body    => 'Some details for some activity',
            body_id => '383777272',
            url     => 'http://api.example.org/activity/feeds/.../af3778',
            user_id => 'example.org:34KJDCSKJN2HHF0DW20394',
        },
    };

    my $data = Data::OpenSocial::Response->new( $src );
    isa_ok( $data, 'Data::OpenSocial::Response' );

    is($data->start_index, $src->{start_index}, '//response/startIndex');
    is($data->items_per_page, $src->{items_per_page}, '//response/itemsPerPage');
    is($data->total_results, $src->{total_results}, '//response/totalResults');

    my $activity = $data->activity;
    
    isa_ok($activity, 'Data::OpenSocial::Activity');
    is($activity->id, $src->{activity}{id}, '//response/activity/id');
    is($activity->title, $src->{activity}{title}, '//response/activity/title');
    isa_ok($activity->updated, 'DateTime');
    is($activity->body, $src->{activity}{body}, '//response/activity/body');
    is($activity->body_id, $src->{activity}{body_id}, '//response/activity/bodyId');
    is($activity->url, $src->{activity}{url}, '//response/activity/url');
}

{
    my $src = +{
        start_index => 1,
        items_per_page => 10,
        total_results => 100,
        entry => [
            +{
                person => +{
                    id           => 'example.org:34KJDCSKJN2HHF0DW20394',
                    display_name => "Janey",
                    name         => +{ formatted => 'Jane Doe' },
                    gender       => 'female',
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Response->new( $src );
    isa_ok( $data, 'Data::OpenSocial::Response' );

    is($data->start_index, $src->{start_index}, '//response/startIndex');
    is($data->items_per_page, $src->{items_per_page}, '//response/itemsPerPage');
    is($data->total_results, $src->{total_results}, '//response/totalResults');

    my $person = $data->entry->[0]->person;
    
    isa_ok($person, 'Data::OpenSocial::Person');
    is($person->id, $src->{entry}[0]{person}{id}, '//response/entry[0]/person/id');
    is($person->display_name, $src->{entry}[0]{person}{display_name}, '//response/entry[0]/person/displayName');
    isa_ok($person->name, 'Data::OpenSocial::Name');
    is($person->name->formatted, $src->{entry}[0]{person}{name}{formatted}, '//response/entry[0]/person/name/formatted');
    is($person->gender, $src->{entry}[0]{person}{gender}, '//response/entry[0]/person/gender');
}

{
    my $src = +{
        start_index => 1,
        items_per_page => 10,
        total_results => 100,
        person => +{
            id           => 'example.org:34KJDCSKJN2HHF0DW20394',
            display_name => "Janey",
            name         => +{ formatted => 'Jane Doe' },
            gender       => 'female',
        },
    };

    my $data = Data::OpenSocial::Response->new( $src );
    isa_ok( $data, 'Data::OpenSocial::Response' );

    is($data->start_index, $src->{start_index}, '//response/startIndex');
    is($data->items_per_page, $src->{items_per_page}, '//response/itemsPerPage');
    is($data->total_results, $src->{total_results}, '//response/totalResults');

    my $person = $data->entry->[0]->person;
    
    isa_ok($person, 'Data::OpenSocial::Person');
    is($person->id, $src->{entry}[0]{person}{id}, '//response/entry[0]/person/id');
    is($person->display_name, $src->{entry}[0]{person}{display_name}, '//response/entry[0]/person/displayName');
    isa_ok($person->name, 'Data::OpenSocial::Name');
    is($person->name->formatted, $src->{entry}[0]{person}{name}{formatted}, '//response/entry[0]/person/name/formatted');
    is($person->gender, $src->{entry}[0]{person}{gender}, '//response/entry[0]/person/gender');
}

{
    my $src = +{
        start_index => 1,
        items_per_page => 10,
        total_results => 100,
        entry => [
            +{
                group => +{
                    id    => 'example.org:34KJDCSKJN2HHF0DW20394/friends',
                    title => 'Peeps',
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Entry->new( group => $src );
    isa_ok( $data, 'Data::OpenSocial::Entry' );

    my $dst = $data->group;
    isa_ok( $dst, 'Data::OpenSocial::Group' );

    is( $dst->id,    $src->{id},    '//entry/group/id' );
    is( $dst->title, $src->{title}, '//entry/group/title' );
}

# {
#     my $src = +{
#         pokes     => 3,
#         last_poke => '2008-02-13T18:30:02Z',
#     };

#     my $data = Data::OpenSocial::Entry->new( app_data => $src );
#     isa_ok( $data, 'Data::OpenSocial::Entry' );

#     my $dst = $data->app_data;
#     isa_ok( $dst, 'Data::OpenSocial::Appdata' );

#     is( $dst->entry->[0]->key, 'last_poke', '//entry/appdata/entry[0]/key' );
#     is( $dst->entry->[0]->value,
#         '2008-02-13T18:30:02Z', '//entry/appdata/entry[0]/value' );
#     is( $dst->entry->[1]->key,   'pokes', '//entry/appdata/entry[1]/key' );
#     is( $dst->entry->[1]->value, 3,       '//entry/appdata/entry[1]/value' );
# }

# {
#     my $src = +{
#         id            => '44332211',
#         thumbnail_url => 'http://pages.example.org/albums/4433221-tn.png',

#         # caption      => 'Example Album', # spec is wrong?
#         description =>
#           'This is an example album, and this text is an example description',
#         location => +{ latitude => 0, longitude => 0 },
#         owner_id => 'example.org:55443322',
#     };

#     my $data = Data::OpenSocial::Entry->new( album => $src );
#     isa_ok( $data, 'Data::OpenSocial::Entry' );

#     my $dst = $data->album;
#     isa_ok( $dst, 'Data::OpenSocial::Album' );

#     is( $dst->id, $src->{id}, '//entry/album/id' );
#     is( $dst->thumbnail_url, $src->{thumbnail_url},
#         '//entry/album/thumbnailUrl' );
#     is( $dst->description, $src->{description}, '//entry/album/description' );
#     is(
#         $dst->location->latitude,
#         $src->{location}{latitude},
#         '//entry/album/location/latitude'
#     );
#     is(
#         $dst->location->longitude,
#         $src->{location}{longitude},
#         '//entry/album/location/longitude'
#     );
#     is( $dst->owner_id, $src->{owner_id}, '//entry/album/owner_id' );
# }

# {
#     my $src = +{
#         id            => '11223344',
#         thumbnail_url => 'http://pages.example.org/images/11223344-tn.png',
#         mime_type     => 'image/png',
#         type          => 'IMAGE',
#         url           => 'http://pages.example.org/images/11223344.png',
#         album_id      => '44332211',
#     };

#     my $data = Data::OpenSocial::Entry->new( media_item => $src );
#     isa_ok( $data, 'Data::OpenSocial::Entry' );

#     my $dst = $data->media_item;
#     isa_ok( $dst, 'Data::OpenSocial::MediaItem' );

#     is( $dst->id, $src->{id}, '//entry/mediaItem/id' );
#     is( $dst->thumbnail_url, $src->{thumbnail_url},
#         '//entry/mediaItem/thumbnailUrl' );
#     is( $dst->mime_type, $src->{mime_type}, '//entry/mediaItem/mimeType' );
#     is( $dst->type,      $src->{type},      '//entry/mediaItem/type' );
#     is( $dst->url,       $src->{url},       '//entry/mediaItem/url' );
#     is( $dst->album_id,  $src->{album_id},  '//entry/mediaItem/albumId' );
# }

done_testing();
