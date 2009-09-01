use strict;
use Test::More;

use Data::OpenSocial::Address;
use Data::OpenSocial::Album;

diag(
    'refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.3.6.1'
);

our %defaults = (
    id           => '44332211',
    thumbnail_url => 'http://pages.example.org/albums/4433221-tn.png',
    # caption      => 'Example Album', # spec is wrong?
    description =>
      'This is an example album, and this text is an example description',
    location => Data::OpenSocial::Address->new(+{ latitude => 0, longitude => 0 }),
    owner_id  => 'example.org:55443322',
);

plan tests => ( ( scalar keys %defaults ) + 1 ) * 1;

{
    my $data = Data::OpenSocial::Album->new;

    isa_ok( $data, 'Data::OpenSocial::Album' );

    for my $attr ( keys %defaults ) {
        $data->$attr( $defaults{$attr} );
        is_deeply( $data->$attr, $defaults{$attr}, $attr . ' attr' );
    }
}
