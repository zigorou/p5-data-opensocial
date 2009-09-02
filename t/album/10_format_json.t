use strict;
use Test::More;

use JSON::Any;
use Data::OpenSocial::Album;
use Data::OpenSocial::Format::JSON;

plan tests => 8 * 1;

diag(
'refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.3.6.1'
);

{
    my $src = +{
        id            => '44332211',
        thumbnailUrl => 'http://pages.example.org/albums/4433221-tn.png',

        # caption      => 'Example Album', # spec is wrong?
        description =>
          'This is an example album, and this text is an example description',
        location => +{ latitude => 0, longitude => 0 },
        ownerId => 'example.org:55443322',
    };

    my $json = JSON::Any->new;
    my $data = Data::OpenSocial::Format::JSON->parse( 'Album', $json->to_json($src) );

    isa_ok($data, 'Data::OpenSocial::Album');

    is($data->id, $src->{id}, 'id');
    is($data->thumbnail_url, $src->{thumbnailUrl}, 'thumbnail_url');
    is($data->description, $src->{description}, 'description');
    is($data->location->latitude, $src->{location}{latitude}, 'location->latitude');
    is($data->location->longitude, $src->{location}{longitude}, 'location->longitude');
    is($data->owner_id, $src->{ownerId}, 'owner_id');

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);
    is_deeply( scalar $json->from_json($json_str), $src, 'format json' );
}
