use strict;

use Test::More;
use JSON::Any;

use Data::OpenSocial::Entry;
use Data::OpenSocial::Format::JSON;

our $json = JSON::Any->new;

{
    my $src = +{
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

    my $data =
      Data::OpenSocial::Format::JSON->parse( 'Entry', $json->to_json($src) );

    isa_ok( $data,           'Data::OpenSocial::Entry' );
    isa_ok( $data->activity, 'Data::OpenSocial::Activity' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note(sprintf('[entry_type %s] %s', $data->entry_type, $json_str));

    is_deeply( scalar $json->from_json($json_str), $src->{activity} );
}

{
    my $src = +{
        person => +{
            id          => 'example.org:34KJDCSKJN2HHF0DW20394',
            displayName => "Janey",
            name        => +{ formatted => 'Jane Doe' },
            gender      => 'female',
        },
    };

    my $data =
      Data::OpenSocial::Format::JSON->parse( 'Entry', $json->to_json($src) );

    isa_ok( $data,         'Data::OpenSocial::Entry' );
    isa_ok( $data->person, 'Data::OpenSocial::Person' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note(sprintf('[entry_type %s] %s', $data->entry_type, $json_str));

    is_deeply( scalar $json->from_json($json_str), $src->{person} );
}

{
    my $src = +{
        group => +{
            id    => 'example.org:34KJDCSKJN2HHF0DW20394/friends',
            title => 'Peeps',
        },
    };

    my $data =
      Data::OpenSocial::Format::JSON->parse( 'Entry', $json->to_json($src) );

    isa_ok( $data,        'Data::OpenSocial::Entry' );
    isa_ok( $data->group, 'Data::OpenSocial::Group' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note(sprintf('[entry_type %s] %s', $data->entry_type, $json_str));

    is_deeply( scalar $json->from_json($json_str), $src->{group} );
}

{
    my $src = +{
        appData => +{
            pokes     => 3,
            last_poke => '2008-02-13T18:30:02Z',
        },
    };

    my $data =
      Data::OpenSocial::Format::JSON->parse( 'Entry', $json->to_json($src) );

    isa_ok( $data,           'Data::OpenSocial::Entry' );
    isa_ok( $data->app_data, 'Data::OpenSocial::Appdata' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note(sprintf('[entry_type %s] %s', $data->entry_type, $json_str));

    is_deeply( scalar $json->from_json($json_str), $src->{appData} );
}

{
    my $src = +{
        album => +{
            id           => '44332211',
            thumbnailUrl => 'http://pages.example.org/albums/4433221-tn.png',

            # caption      => 'Example Album', # spec is wrong?
            description =>
'This is an example album, and this text is an example description',
            location => +{ latitude => 0, longitude => 0 },
            ownerId  => 'example.org:55443322',
        },
    };

    my $data =
      Data::OpenSocial::Format::JSON->parse( 'Entry', $json->to_json($src) );

    isa_ok( $data,        'Data::OpenSocial::Entry' );
    isa_ok( $data->album, 'Data::OpenSocial::Album' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note(sprintf('[entry_type %s] %s', $data->entry_type, $json_str));

    is_deeply( scalar $json->from_json($json_str), $src->{album} );
}

{
    my $src = +{
        mediaItem => +{
            id           => '11223344',
            thumbnailUrl => 'http://pages.example.org/images/11223344-tn.png',
            mimeType     => 'image/png',
            type         => 'IMAGE',
            url          => 'http://pages.example.org/images/11223344.png',
            albumId      => '44332211',
        },
    };

    my $data =
      Data::OpenSocial::Format::JSON->parse( 'Entry', $json->to_json($src) );

    isa_ok( $data,             'Data::OpenSocial::Entry' );
    isa_ok( $data->media_item, 'Data::OpenSocial::MediaItem' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note(sprintf('[entry_type %s] %s', $data->entry_type, $json_str));

    is_deeply( scalar $json->from_json($json_str), $src->{mediaItem} );
}

done_testing();
