use strict;
use Test::More;
use Data::OpenSocial::AppdataEntry;

plan tests => 3 * 1;

{
    my $data =
      Data::OpenSocial::AppdataEntry->new( key => 'pokes', value => 3 );
    isa_ok( $data, 'Data::OpenSocial::AppdataEntry' );

    is( $data->key,   'pokes' );
    is( $data->value, 3 );
}

