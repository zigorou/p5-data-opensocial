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
    is($activity->id, $src->{entry}[0]{activity}{id}, '//response/entry[0]/activity/id');
    is($activity->title, $src->{entry}[0]{activity}{title}, '//response/entry[0]/activity/title');
    isa_ok($activity->updated, 'DateTime');
    is($activity->body, $src->{entry}[0]{activity}{body}, '//response/entry[0]/activity/body');
    is($activity->body_id, $src->{entry}[0]{activity}{body_id}, '//response/entry[0]/activity/bodyId');
    is($activity->url, $src->{entry}[0]{activity}{url}, '//response/entry[0]/activity/url');
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

    my $person = $data->person;
    
    isa_ok($person, 'Data::OpenSocial::Person');
    is($person->id, $src->{person}{id}, '//response/entry[0]/person/id');
    is($person->display_name, $src->{person}{display_name}, '//response/entry[0]/person/displayName');
    isa_ok($person->name, 'Data::OpenSocial::Name');
    is($person->name->formatted, $src->{person}{name}{formatted}, '//response/entry[0]/person/name/formatted');
    is($person->gender, $src->{person}{gender}, '//response/entry[0]/person/gender');
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

    my $data = Data::OpenSocial::Response->new( $src );
    isa_ok( $data, 'Data::OpenSocial::Response' );

    is($data->start_index, $src->{start_index}, '//response/startIndex');
    is($data->items_per_page, $src->{items_per_page}, '//response/itemsPerPage');
    is($data->total_results, $src->{total_results}, '//response/totalResults');
    
    my $dst = $data->entry->[0]->group;
    isa_ok( $dst, 'Data::OpenSocial::Group' );

    is( $dst->id,    $src->{entry}[0]{group}{id},    '//response/entry[0]/group/id' );
    is( $dst->title, $src->{entry}[0]{group}{title}, '//response/entry[0]/group/title' );
}

{
    my $src = +{
        start_index    => 1,
        items_per_page => 10,
        total_results  => 100,
        group          => +{
            id    => 'example.org:34KJDCSKJN2HHF0DW20394/friends',
            title => 'Peeps',
        },
    };

    my $data = Data::OpenSocial::Response->new( $src );

    isa_ok( $data, 'Data::OpenSocial::Response' );
    
    is($data->start_index, $src->{start_index}, '//response/startIndex');
    is($data->items_per_page, $src->{items_per_page}, '//response/itemsPerPage');
    is($data->total_results, $src->{total_results}, '//response/totalResults');

    my $dst = $data->group;
    isa_ok( $dst, 'Data::OpenSocial::Group' );

    is( $dst->id,    $src->{group}{id},    '//response/group/id' );
    is( $dst->title, $src->{group}{title}, '//response/group/title' );
}

{
    my $src = +{
        start_index    => 1,
        items_per_page => 10,
        total_results  => 100,
        entry => [
            +{
                app_data => +{
                    pokes     => 3,
                    last_poke => '2008-02-13T18:30:02Z',
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Response->new( $src );
    isa_ok( $data, 'Data::OpenSocial::Response' );

    is($data->start_index, $src->{start_index}, '//response/startIndex');
    is($data->items_per_page, $src->{items_per_page}, '//response/itemsPerPage');
    is($data->total_results, $src->{total_results}, '//response/totalResults');

    my $dst = $data->entry->[0]->app_data;
    isa_ok( $dst, 'Data::OpenSocial::Appdata' );

    is( $dst->entry->[0]->key, 'last_poke', '//response/entry[0]/appdata/entry[0]/key' );
    is( $dst->entry->[0]->value,
        '2008-02-13T18:30:02Z', '//response/entry[0]/appdata/entry[0]/value' );
    is( $dst->entry->[1]->key,   'pokes', '//response/entry[0]/appdata/entry[1]/key' );
    is( $dst->entry->[1]->value, 3,       '//response/entry[0]/appdata/entry[1]/value' );
}

{
    my $src = +{
        start_index    => 1,
        items_per_page => 10,
        total_results  => 2,
        entry => [
            +{
                app_data => +{
                    person_id => '34KJDCSKJN2HHF0DW20394',
                    entry => +{
                        pokes     => 3,
                        last_poke => '2008-02-13T18:30:02Z',
                    },
                },
            },
            +{
                app_data => +{
                    person_id => '58UIDCSIOP233FDKK3HD44',
                    entry => +{
                        pokes => 2,
                        last_poke => '2007-12-16T18:30:02Z',
                    },
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Response->new( $src );
    isa_ok( $data, 'Data::OpenSocial::Response' );

    is($data->start_index, $src->{start_index}, '//response/startIndex');
    is($data->items_per_page, $src->{items_per_page}, '//response/itemsPerPage');
    is($data->total_results, $src->{total_results}, '//response/totalResults');

    my $i = 0;
    for my $dst (map { $_->app_data } @{$data->entry}) {
        isa_ok( $dst, 'Data::OpenSocial::Appdata' );

        note(explain($dst));
        
        is( $dst->person_id, $src->{entry}[$i]{app_data}{person_id}, "//response/entry[$i]/appdata/personId");
        is( $dst->entry->[0]->key, 'last_poke', "//response/entry[$i]/appdata/entry[0]/key" );
        is( $dst->entry->[0]->value,
            $src->{entry}[$i]{app_data}{entry}{last_poke}, "//response/entry[$i]/appdata/entry[0]/value" );
        is( $dst->entry->[1]->key,   'pokes', "//response/entry[$i]/appdata/entry[1]/key" );
        is( $dst->entry->[1]->value, $src->{entry}[$i]{app_data}{entry}{pokes},       "//response/entry[$i]/appdata/entry[1]/value" );
        
        $i++;
    }
    
    my $dst = $data->entry->[0]->app_data;
    isa_ok( $dst, 'Data::OpenSocial::Appdata' );

    is( $dst->entry->[0]->key, 'last_poke', '//response/entry[0]/appdata/entry[0]/key' );
    is( $dst->entry->[0]->value,
        '2008-02-13T18:30:02Z', '//response/entry[0]/appdata/entry[0]/value' );
    is( $dst->entry->[1]->key,   'pokes', '//response/entry[0]/appdata/entry[1]/key' );
    is( $dst->entry->[1]->value, 3,       '//response/entry[0]/appdata/entry[1]/value' );
}

{
    my $src = +{
        start_index    => 1,
        items_per_page => 10,
        total_results  => 2,
        entry => [
            +{
                app_data => +{
                    person_id => '34KJDCSKJN2HHF0DW20394',
                    entry => +{
                        pokes     => 3,
                        last_poke => '2008-02-13T18:30:02Z',
                    },
                },
            },
            +{
                app_data => +{
                    person_id => '58UIDCSIOP233FDKK3HD44',
                    entry => +{
                        pokes => 2,
                        last_poke => '2007-12-16T18:30:02Z',
                    },
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Response->new( $src );
    isa_ok( $data, 'Data::OpenSocial::Response' );

    is($data->start_index, $src->{start_index}, '//response/startIndex');
    is($data->items_per_page, $src->{items_per_page}, '//response/itemsPerPage');
    is($data->total_results, $src->{total_results}, '//response/totalResults');

    my $i = 0;
    for my $dst (map { $_->app_data } @{$data->entry}) {
        isa_ok( $dst, 'Data::OpenSocial::Appdata' );

        note(explain($dst));
        
        is( $dst->person_id, $src->{entry}[$i]{app_data}{person_id}, "//response/entry[$i]/appdata/personId");
        is( $dst->entry->[0]->key, 'last_poke', "//response/entry[$i]/appdata/entry[0]/key" );
        is( $dst->entry->[0]->value,
            $src->{entry}[$i]{app_data}{entry}{last_poke}, "//response/entry[$i]/appdata/entry[0]/value" );
        is( $dst->entry->[1]->key,   'pokes', "//response/entry[$i]/appdata/entry[1]/key" );
        is( $dst->entry->[1]->value, $src->{entry}[$i]{app_data}{entry}{pokes},       "//response/entry[$i]/appdata/entry[1]/value" );
        
        $i++;
    }
    
    my $dst = $data->entry->[0]->app_data;
    isa_ok( $dst, 'Data::OpenSocial::Appdata' );

    is( $dst->entry->[0]->key, 'last_poke', '//response/entry[0]/appdata/entry[0]/key' );
    is( $dst->entry->[0]->value,
        '2008-02-13T18:30:02Z', '//response/entry[0]/appdata/entry[0]/value' );
    is( $dst->entry->[1]->key,   'pokes', '//response/entry[0]/appdata/entry[1]/key' );
    is( $dst->entry->[1]->value, 3,       '//response/entry[0]/appdata/entry[1]/value' );
}

{
    my $src = +{
        start_index    => 1,
        items_per_page => 10,
        total_results  => 100,
        entry => [
            +{
                album => +{
                    id            => '44332211',
                    thumbnail_url => 'http://pages.example.org/albums/4433221-tn.png',
                    # caption      => 'Example Album', # spec is wrong?
                    description =>
                        'This is an example album, and this text is an example description',
                    location => +{ latitude => 0, longitude => 0 },
                    owner_id => 'example.org:55443322',
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Response->new( $src );
    isa_ok( $data, 'Data::OpenSocial::Response' );

    is($data->start_index, $src->{start_index}, '//response/startIndex');
    is($data->items_per_page, $src->{items_per_page}, '//response/itemsPerPage');
    is($data->total_results, $src->{total_results}, '//response/totalResults');

    my $dst = $data->entry->[0]->album;
    isa_ok( $dst, 'Data::OpenSocial::Album' );

    is( $dst->id, $src->{entry}[0]{album}{id}, '//response/entry[0]/album/id' );
    is( $dst->thumbnail_url, $src->{entry}[0]{album}{thumbnail_url},
        '//response/entry[0]/album/thumbnailUrl' );
    is( $dst->description, $src->{entry}[0]{album}{description}, '//response/entry[0]/album/description' );
    is(
        $dst->location->latitude,
        $src->{entry}[0]{album}{location}{latitude},
        '//response/entry[0]/album/location/latitude'
    );
    is(
        $dst->location->longitude,
        $src->{entry}[0]{album}{location}{longitude},
        '//response/entry[0]/album/location/longitude'
    );
    is( $dst->owner_id, $src->{entry}[0]{album}{owner_id}, '//response/entry[0]/album/owner_id' );
}

{
    my $src = +{
        start_index    => 1,
        items_per_page => 10,
        total_results  => 100,
        album => +{
            id            => '44332211',
            thumbnail_url => 'http://pages.example.org/albums/4433221-tn.png',
            # caption      => 'Example Album', # spec is wrong?
            description =>
                'This is an example album, and this text is an example description',
            location => +{ latitude => 0, longitude => 0 },
            owner_id => 'example.org:55443322',
        },
    };

    my $data = Data::OpenSocial::Response->new( $src );
    isa_ok( $data, 'Data::OpenSocial::Response' );

    is($data->start_index, $src->{start_index}, '//response/startIndex');
    is($data->items_per_page, $src->{items_per_page}, '//response/itemsPerPage');
    is($data->total_results, $src->{total_results}, '//response/totalResults');

    my $dst = $data->album;
    isa_ok( $dst, 'Data::OpenSocial::Album' );

    is( $dst->id, $src->{album}{id}, '//response/album/id' );
    is( $dst->thumbnail_url, $src->{album}{thumbnail_url},
        '//response/album/thumbnailUrl' );
    is( $dst->description, $src->{album}{description}, '//response/album/description' );
    is(
        $dst->location->latitude,
        $src->{album}{location}{latitude},
        '//response/album/location/latitude'
    );
    is(
        $dst->location->longitude,
        $src->{album}{location}{longitude},
        '//response/album/location/longitude'
    );
    is( $dst->owner_id, $src->{album}{owner_id}, '//response/album/owner_id' );
}

{
    my $src = +{
        start_index    => 1,
        items_per_page => 10,
        total_results  => 100,
        entry => [
            +{
                media_item => +{
                    id            => '11223344',
                    thumbnail_url => 'http://pages.example.org/images/11223344-tn.png',
                    mime_type     => 'image/png',
                    type          => 'IMAGE',
                    url           => 'http://pages.example.org/images/11223344.png',
                    album_id      => '44332211',
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Response->new( $src );
    isa_ok( $data, 'Data::OpenSocial::Response' );

    is($data->start_index, $src->{start_index}, '//response/startIndex');
    is($data->items_per_page, $src->{items_per_page}, '//response/itemsPerPage');
    is($data->total_results, $src->{total_results}, '//response/totalResults');
    
    my $dst = $data->entry->[0]->media_item;
    isa_ok( $dst, 'Data::OpenSocial::MediaItem' );

    is( $dst->id, $src->{entry}[0]{media_item}{id}, '//entry/mediaItem/id' );
    is( $dst->thumbnail_url, $src->{entry}[0]{media_item}{thumbnail_url},
        '//entry/mediaItem/thumbnailUrl' );
    is( $dst->mime_type, $src->{entry}[0]{media_item}{mime_type}, '//entry/mediaItem/mimeType' );
    is( $dst->type,      $src->{entry}[0]{media_item}{type},      '//entry/mediaItem/type' );
    is( $dst->url,       $src->{entry}[0]{media_item}{url},       '//entry/mediaItem/url' );
    is( $dst->album_id,  $src->{entry}[0]{media_item}{album_id},  '//entry/mediaItem/albumId' );
}

{
    my $src = +{
        start_index    => 1,
        items_per_page => 10,
        total_results  => 100,
        media_item => +{
            id            => '11223344',
            thumbnail_url => 'http://pages.example.org/images/11223344-tn.png',
            mime_type     => 'image/png',
            type          => 'IMAGE',
            url           => 'http://pages.example.org/images/11223344.png',
            album_id      => '44332211',
        },
    };

    my $data = Data::OpenSocial::Response->new( $src );
    isa_ok( $data, 'Data::OpenSocial::Response' );

    is($data->start_index, $src->{start_index}, '//response/startIndex');
    is($data->items_per_page, $src->{items_per_page}, '//response/itemsPerPage');
    is($data->total_results, $src->{total_results}, '//response/totalResults');
    
    my $dst = $data->media_item;
    isa_ok( $dst, 'Data::OpenSocial::MediaItem' );

    is( $dst->id, $src->{media_item}{id}, '//entry/mediaItem/id' );
    is( $dst->thumbnail_url, $src->{media_item}{thumbnail_url},
        '//entry/mediaItem/thumbnailUrl' );
    is( $dst->mime_type, $src->{media_item}{mime_type}, '//entry/mediaItem/mimeType' );
    is( $dst->type,      $src->{media_item}{type},      '//entry/mediaItem/type' );
    is( $dst->url,       $src->{media_item}{url},       '//entry/mediaItem/url' );
    is( $dst->album_id,  $src->{media_item}{album_id},  '//entry/mediaItem/albumId' );
}

done_testing();
