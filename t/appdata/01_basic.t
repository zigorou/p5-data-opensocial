use strict;
use Test::More;
use Data::OpenSocial::Appdata;
use Data::OpenSocial::AppdataEntry;

diag(
'refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.3.5.1'
);

{
    diag('multiple entries with entirely format');
    
    my %defaults =
      ( entry => [ +{ key => 'pokes', value => 3 }, +{ key => 'last_poke', value => '2008-02-13T18:30:02Z' }, ],
      );
    my $appdata_entries = [
        map {
            Data::OpenSocial::AppdataEntry->new(
                key   => $_->{key},
                value => $_->{value}
              )
        }
        @{ $defaults{entry} }
    ];

    {
        my $data = Data::OpenSocial::Appdata->new;
        isa_ok( $data, 'Data::OpenSocial::Appdata' );

        $data->entry($appdata_entries);
        is_deeply( $data->entry, $appdata_entries, 'get/set accessor test' );
    }

    {
        my $data = Data::OpenSocial::Appdata->new;
        isa_ok( $data, 'Data::OpenSocial::Appdata' );

        $data->entry( $defaults{entry} );
        is_deeply( $data->entry, $appdata_entries, 'with coercing' );
    }
}

{
    diag('multiple entries with abbr format');
    
    my %defaults =
      ( entry => [ +{ pokes => 3 }, +{ last_poke => '2008-02-13T18:30:02Z' }, ],
      );
    my $appdata_entries = [
        map {
            Data::OpenSocial::AppdataEntry->new(
                key   => $_->[0],
                value => $_->[1]
              )
          }
          map { [ keys %$_, values %$_ ] } @{ $defaults{entry} }
    ];

    {
        my $data = Data::OpenSocial::Appdata->new;
        isa_ok( $data, 'Data::OpenSocial::Appdata' );

        $data->entry($appdata_entries);
        is_deeply( $data->entry, $appdata_entries, 'get/set accessor test' );
    }

    {
        my $data = Data::OpenSocial::Appdata->new;
        isa_ok( $data, 'Data::OpenSocial::Appdata' );

        $data->entry( $defaults{entry} );
        is_deeply( $data->entry, $appdata_entries, 'with coercing' );
    }
}

{
    diag('single entry with entirely format');
    
    my %defaults =
      ( entry => +{ key => 'pokes', value => 3, } );
    my $appdata_entries = [ Data::OpenSocial::AppdataEntry->new(
        key   => 'pokes',
        value => 3
    ) ];

    {
        my $data = Data::OpenSocial::Appdata->new;
        isa_ok( $data, 'Data::OpenSocial::Appdata' );

        $data->entry($appdata_entries);
        is_deeply( $data->entry, $appdata_entries, 'get/set accessor test' );
    }

    {
        my $data = Data::OpenSocial::Appdata->new;
        isa_ok( $data, 'Data::OpenSocial::Appdata' );

        $data->entry( $defaults{entry} );
        is_deeply( $data->entry, $appdata_entries, 'with coercing' );
    }
}

{
    diag('single entry with abbr format');
    
    my %defaults = (
        entry => +{ pokes => 3, },
    );

    my $appdata_entries = [
        Data::OpenSocial::AppdataEntry->new( key => 'pokes', value => 3, ),
    ];

    {
        my $data = Data::OpenSocial::Appdata->new;
        isa_ok( $data, 'Data::OpenSocial::Appdata' );

        $data->entry($appdata_entries);
        is_deeply( $data->entry, $appdata_entries, 'get/set accessor test' );
    }

    {
        my $data = Data::OpenSocial::Appdata->new;
        isa_ok( $data, 'Data::OpenSocial::Appdata' );

        $data->entry( $defaults{entry} );
        is_deeply( $data->entry, $appdata_entries, 'with coercing' );
    }
}

done_testing;
