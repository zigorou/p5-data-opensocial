use strict;

use Test::More;
use JSON::Any;

use Data::OpenSocial::Response;
use Data::OpenSocial::Format::JSON;

our $json = JSON::Any->new;

{
    my $src = +{
        startIndex => 1,
        itemsPerPage => 10,
        totalResults => 100,
        entry => [
            +{
                activity => +{
                    id =>
                        'http://example.org/activities/example.org:87ead8dead6beef/self/af3778',
                    title   => '<a href="foo">some activity</a>',
                    updated => '2008-02-20T23:35:37',
                    body    => 'Some details for some activity',
                    bodyId  => '383777272',
                    url     => 'http://api.example.org/activity/feeds/.../af3778',
                    userId  => 'example.org:34KJDCSKJN2HHF0DW20394',
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Format::JSON->parse( 'Response', $json->to_json($src) );
   
    isa_ok( $data, 'Data::OpenSocial::Response' );
    isa_ok( $data->entry->[0]->activity, 'Data::OpenSocial::Activity' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);

    is_deeply( scalar $json->from_json($json_str), $src );
}

{
    my $src = +{
        startIndex => 1,
        itemsPerPage => 10,
        totalResults => 100,
        activity => +{
            id =>
                'http://example.org/activities/example.org:87ead8dead6beef/self/af3778',
            title   => '<a href="foo">some activity</a>',
            updated => '2008-02-20T23:35:37',
            body    => 'Some details for some activity',
            bodyId  => '383777272',
            url     => 'http://api.example.org/activity/feeds/.../af3778',
            userId  => 'example.org:34KJDCSKJN2HHF0DW20394',
        },
    };

    my $data = Data::OpenSocial::Format::JSON->parse( 'Response', $json->to_json($src) );
   
    isa_ok( $data, 'Data::OpenSocial::Response' );
    isa_ok( $data->activity, 'Data::OpenSocial::Activity' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);

    is_deeply( scalar $json->from_json($json_str), $src );
}

{
    my $src = +{
        startIndex => 1,
        itemsPerPage => 10,
        totalResults => 100,
        entry => [
            +{
                person => +{
                    id           => 'example.org:34KJDCSKJN2HHF0DW20394',
                    displayName => "Janey",
                    name         => +{ formatted => 'Jane Doe' },
                    gender       => 'female',
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Format::JSON->parse( 'Response', $json->to_json($src) );
   
    isa_ok( $data, 'Data::OpenSocial::Response' );
    isa_ok( $data->entry->[0]->person, 'Data::OpenSocial::Person' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);

    is_deeply( scalar $json->from_json($json_str), $src );
}

{
    my $src = +{
        startIndex => 1,
        itemsPerPage => 10,
        totalResults => 100,
        person => +{
            id           => 'example.org:34KJDCSKJN2HHF0DW20394',
            displayName => "Janey",
            name         => +{ formatted => 'Jane Doe' },
            gender       => 'female',
        },
    };

    my $data = Data::OpenSocial::Format::JSON->parse( 'Response', $json->to_json($src) );
   
    isa_ok( $data, 'Data::OpenSocial::Response' );
    isa_ok( $data->person, 'Data::OpenSocial::Person' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);

    is_deeply( scalar $json->from_json($json_str), $src );
}

{
    my $src = +{
        startIndex => 1,
        itemsPerPage => 10,
        totalResults => 100,
        entry => [
            +{
                group => +{
                    id    => 'example.org:34KJDCSKJN2HHF0DW20394/friends',
                    title => 'Peeps',
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Format::JSON->parse( 'Response', $json->to_json($src) );
   
    isa_ok( $data, 'Data::OpenSocial::Response' );
    isa_ok( $data->entry->[0]->group, 'Data::OpenSocial::Group' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);

    is_deeply( scalar $json->from_json($json_str), $src );
}

{
    my $src = +{
        startIndex => 1,
        itemsPerPage => 10,
        totalResults => 100,
        group          => +{
            id    => 'example.org:34KJDCSKJN2HHF0DW20394/friends',
            title => 'Peeps',
        },
    };

    my $data = Data::OpenSocial::Format::JSON->parse( 'Response', $json->to_json($src) );
   
    isa_ok( $data, 'Data::OpenSocial::Response' );
    isa_ok( $data->group, 'Data::OpenSocial::Group' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);

    is_deeply( scalar $json->from_json($json_str), $src );
}

{
    my $src = +{
        startIndex => 1,
        itemsPerPage => 10,
        totalResults => 100,
        entry => [
            +{
                appData => +{
                    pokes     => 3,
                    last_poke => '2008-02-13T18:30:02Z',
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Format::JSON->parse( 'Response', $json->to_json($src) );
   
    isa_ok( $data, 'Data::OpenSocial::Response' );
    isa_ok( $data->entry->[0]->app_data, 'Data::OpenSocial::Appdata' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);

    is_deeply( scalar $json->from_json($json_str), $src );
}

{
    my $src = +{
        startIndex => 1,
        itemsPerPage => 10,
        totalResults => 100,
        entry => [
            +{
                album => +{
                    id            => '44332211',
                    thumbnailUrl => 'http://pages.example.org/albums/4433221-tn.png',
                    # caption      => 'Example Album', # spec is wrong?
                    description =>
                        'This is an example album, and this text is an example description',
                    location => +{ latitude => 0, longitude => 0 },
                    ownerId => 'example.org:55443322',
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Format::JSON->parse( 'Response', $json->to_json($src) );
   
    isa_ok( $data, 'Data::OpenSocial::Response' );
    isa_ok( $data->entry->[0]->album, 'Data::OpenSocial::Album' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);

    is_deeply( scalar $json->from_json($json_str), $src );
}

{
    my $src = +{
        startIndex => 1,
        itemsPerPage => 10,
        totalResults => 100,
        album => +{
            id            => '44332211',
            thumbnailUrl => 'http://pages.example.org/albums/4433221-tn.png',
            # caption      => 'Example Album', # spec is wrong?
            description =>
                'This is an example album, and this text is an example description',
            location => +{ latitude => 0, longitude => 0 },
            ownerId => 'example.org:55443322',
        },
    };

    my $data = Data::OpenSocial::Format::JSON->parse( 'Response', $json->to_json($src) );
   
    isa_ok( $data, 'Data::OpenSocial::Response' );
    isa_ok( $data->album, 'Data::OpenSocial::Album' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);

    is_deeply( scalar $json->from_json($json_str), $src );
}

{
    my $src = +{
        startIndex => 1,
        itemsPerPage => 10,
        totalResults => 100,
        entry => [
            +{
                mediaItem => +{
                    id            => '11223344',
                    thumbnailUrl => 'http://pages.example.org/images/11223344-tn.png',
                    mimeType     => 'image/png',
                    type          => 'IMAGE',
                    url           => 'http://pages.example.org/images/11223344.png',
                    albumId      => '44332211',
                },
            },
        ],
    };

    my $data = Data::OpenSocial::Format::JSON->parse( 'Response', $json->to_json($src) );
   
    isa_ok( $data, 'Data::OpenSocial::Response' );
    isa_ok( $data->entry->[0]->media_item, 'Data::OpenSocial::MediaItem' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);

    is_deeply( scalar $json->from_json($json_str), $src );
}

{
    my $src = +{
        startIndex => 1,
        itemsPerPage => 10,
        totalResults => 100,
        mediaItem => +{
            id            => '11223344',
            thumbnailUrl => 'http://pages.example.org/images/11223344-tn.png',
            mimeType     => 'image/png',
            type          => 'IMAGE',
            url           => 'http://pages.example.org/images/11223344.png',
            albumId      => '44332211',
        },
    };

    my $data = Data::OpenSocial::Format::JSON->parse( 'Response', $json->to_json($src) );
   
    isa_ok( $data, 'Data::OpenSocial::Response' );
    isa_ok( $data->media_item, 'Data::OpenSocial::MediaItem' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);

    is_deeply( scalar $json->from_json($json_str), $src );
}

done_testing;

__END__

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
