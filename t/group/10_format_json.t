use strict;
use Test::More;

use JSON::Any;
use Data::OpenSocial::Group;
use Data::OpenSocial::Format::JSON;

plan tests => 3 * 1;

diag(
'refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.3.3'
);

{
    my $src = +{
        id    => 'example.org:34KJDCSKJN2HHF0DW20394/friends',
        title => 'Peeps',
    };

    my $json = JSON::Any->new;
    my $data =
      Data::OpenSocial::Format::JSON->parse( 'Group', $json->to_json($src) );

    is( $data->id,    $src->{id},    'id' );
    is( $data->title, $src->{title}, 'title' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);

    note($json_str);

    is_deeply( scalar $json->from_json($json_str), $src, 'format json' );
}
