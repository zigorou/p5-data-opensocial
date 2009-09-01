use strict;
use Test::More;

use JSON::Any;
use Data::OpenSocial::Activity;
use Data::OpenSocial::Format::JSON;

plan tests => 8 * 1;

diag('refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.3.4');

{
    my $src = +{
        id      => 'http://example.org/activities/example.org:87ead8dead6beef/self/af3778',
        title   => '<a href="foo">some activity</a>',
        updated => '2008-02-20T23:35:37',
        body    => 'Some details for some activity',
        bodyId  => '383777272',
        url     => 'http://api.example.org/activity/feeds/.../af3778',
        userId  => 'example.org:34KJDCSKJN2HHF0DW20394',
    };

    my $json = JSON::Any->new;
    my $data = Data::OpenSocial::Format::JSON->parse( 'Activity', $json->to_json($src) );

    is( $data->id,      $src->{id},      'id' );
    is( $data->title,   $src->{title},   'title' );
    is( $data->updated, $src->{updated}, 'updated' );
    is( $data->body,    $src->{body},    'body' );
    is( $data->body_id, $src->{bodyId},  'body_id' );
    is( $data->url,     $src->{url},     'url' );
    is( $data->user_id, $src->{userId},  'user_id' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);

    note($json_str);
    
    is_deeply( scalar $json->from_json($json_str), $src, 'format json' );
}
