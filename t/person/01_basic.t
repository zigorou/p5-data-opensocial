use strict;
use Test::More;

use Data::OpenSocial::Name;
use Data::OpenSocial::Person;

diag('refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.3.3');

our %defaults = (
    id           => 'example.org:34KJDCSKJN2HHF0DW20394',
    display_name => "Janey",
    name         => Data::OpenSocial::Name->new(+{ formatted => 'Jane Doe' }),
    gender       => 'female',
);

{
    my $data = Data::OpenSocial::Person->new;

    isa_ok( $data, 'Data::OpenSocial::Person' );

    for my $attr ( keys %defaults ) {
        $data->$attr( $defaults{$attr} );
        is_deeply( $data->$attr, $defaults{$attr}, $attr . ' attr' );
    }
}

{
    my $data = Data::OpenSocial::Person->new(%defaults);

    isa_ok( $data, 'Data::OpenSocial::Person' );

    for my $attr ( keys %defaults ) {
        is_deeply( $data->$attr, $defaults{$attr}, $attr . ' attr' );
    }
}

done_testing();
