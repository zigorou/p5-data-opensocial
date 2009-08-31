use strict;
use Test::More;
use Data::OpenSocial::Appdata;

diag(
'refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.3.5.1'
);

plan tests => 4;

our %defaults =
  ( entry => [ +{ pokes => 3 }, +{ last_poke => '2008-02-13T18:30:02Z' }, ], );

my $appdata_entries = [
    map {
        Data::OpenSocial::AppdataEntry->new( key => $_->[0], value => $_->[1] )
      }
      map { [ keys %$_, values %$_ ] } @{ $defaults{entry} }
];

{
    my $data = Data::OpenSocial::Appdata->new;
    isa_ok( $data, 'Data::OpenSocial::Appdata' );

    $data->entry($appdata_entries);
    is_deeply( $data->entry, $appdata_entries );
}

{
    my $data = Data::OpenSocial::Appdata->new;
    isa_ok( $data, 'Data::OpenSocial::Appdata' );

    $data->entry( $defaults{entry} );
    is_deeply( $data->entry, $appdata_entries );
}
