use Test::More;

use DateTime;
use Data::OpenSocial::Activity;

diag(
'refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.3.4'
);

our %defaults = (
    id =>
      'http://example.org/activities/example.org:87ead8dead6beef/self/af3778',
    title   => '<a href="foo">some activity</a>',
    updated => '2008-02-20T23:35:37',
    body    => 'Some details for some activity',
    body_id => '383777272',
    url     => 'http://api.example.org/activity/feeds/.../af3778',
    user_id => 'example.org:34KJDCSKJN2HHF0DW20394',
);

plan tests => ( ( scalar keys %defaults ) + 1 ) * 2;

{
    my $data = Data::OpenSocial::Activity->new;

    isa_ok( $data, 'Data::OpenSocial::Activity' );

    for my $attr ( keys %defaults ) {
        $data->$attr( $defaults{$attr} );
        is( $data->$attr, $defaults{$attr}, $attr . ' attr' );
    }
}

{
    my $data = Data::OpenSocial::Activity->new(%defaults);

    isa_ok( $data, 'Data::OpenSocial::Activity' );

    for my $attr ( keys %defaults ) {
        is( $data->$attr, $defaults{$attr}, $attr . ' attr' );
    }
}
