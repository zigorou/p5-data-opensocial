use strict;
use Test::More;

use Data::OpenSocial::Address;
use Data::OpenSocial::MediaItem;

diag(
    'refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.3.6.1'
);

our %defaults = (
    id            => '11223344',
    thumbnail_url => 'http://pages.example.org/images/11223344-tn.png',
    mime_type     => 'image/png',
    type          => 'IMAGE',
    url           => 'http://pages.example.org/images/11223344.png',
    album_id      => '44332211',
);

plan tests => ( ( scalar keys %defaults ) + 1 ) * 1;

{
    my $data = Data::OpenSocial::MediaItem->new;

    isa_ok( $data, 'Data::OpenSocial::MediaItem' );

    for my $attr ( keys %defaults ) {
        $data->$attr( $defaults{$attr} );
        is_deeply( $data->$attr, $defaults{$attr}, $attr . ' attr' );
    }
}
