use strict;
use Test::More;

use Data::OpenSocial::Message;

diag(
    'refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.10.2'
);

our %defaults = (
    id => 'http://example.org/inbox/message/{msgid}',
    recipients =>
      [ 'example.org:AD38B3886625AAF', 'example.org:997638BAA6F25AD' ],
    sender_id => 'example.org:34KJDCSKJN2HHF0DW20394',
    title     => 'You have a new messge from Joe',
    title_id  => '541141091700',
    body      => 'Short message from Joe to some friends',
    body_id   => '5491155811231',
    type      => 'PRIVATE_MESSAGE',
    status    => 'unread',
    # data => '...'
);

plan tests => ( ( scalar keys %defaults ) + 1 ) * 1;

{
    my $data = Data::OpenSocial::Message->new;

    isa_ok( $data, 'Data::OpenSocial::Message' );

    for my $attr ( keys %defaults ) {
        $data->$attr( $defaults{$attr} );
        is_deeply( $data->$attr, $defaults{$attr}, $attr . ' attr' );
    }
}
