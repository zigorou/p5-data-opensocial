use strict;
use Test::More;

use Data::OpenSocial::Group;

diag(
'refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.3.3'
);

our %defaults = (
    id    => 'example.org:34KJDCSKJN2HHF0DW20394/friends',
    title => 'Peeps',
);

plan tests => ( ( scalar keys %defaults ) + 1 ) * 2;

{
    my $data = Data::OpenSocial::Group->new;

    isa_ok( $data, 'Data::OpenSocial::Group' );

    for my $attr ( keys %defaults ) {
        $data->$attr( $defaults{$attr} );
        is( $data->$attr, $defaults{$attr}, $attr . ' attr' );
    }
}

{
    my $data = Data::OpenSocial::Group->new(%defaults);

    isa_ok( $data, 'Data::OpenSocial::Group' );

    for my $attr ( keys %defaults ) {
        is( $data->$attr, $defaults{$attr}, $attr . ' attr' );
    }
}
