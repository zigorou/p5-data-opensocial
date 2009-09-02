use strict;
use Test::More;

use JSON::Any;
use Data::OpenSocial::MediaItem;
use Data::OpenSocial::Format::JSON;

plan tests => 8 * 1;

diag(
'refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.3.6.2'
);

{
    my $src = +{
        id           => '11223344',
        thumbnailUrl => 'http://pages.example.org/images/11223344-tn.png',
        mimeType     => 'image/png',
        type         => 'IMAGE',
        url          => 'http://pages.example.org/images/11223344.png',
        albumId      => '44332211',
    };

    my $json = JSON::Any->new;
    my $data =
      Data::OpenSocial::Format::JSON->parse( 'MediaItem',
        $json->to_json($src) );

    isa_ok( $data, 'Data::OpenSocial::MediaItem' );

    is( $data->id,            $src->{id},           'id' );
    is( $data->thumbnail_url, $src->{thumbnailUrl}, 'thumbnailUrl' );
    is( $data->mime_type,     $src->{mimeType},     'mimeType' );
    is( $data->type,          $src->{type},         'type' );
    is( $data->url,           $src->{url},          'url' );
    is( $data->album_id,      $src->{albumId},      'albumId' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);
    is_deeply( scalar $json->from_json($json_str), $src, 'format json' );
}
