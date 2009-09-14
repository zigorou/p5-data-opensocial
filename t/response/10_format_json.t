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
