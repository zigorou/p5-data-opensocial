use strict;
use Test::More;

use JSON::Any;
use Data::OpenSocial::Appdata;

plan tests => 5 * 2;

diag('refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.3.5.1');

{
    my $src = +{
        pokes => 3,
        last_poke => "2008-02-13T18:30:02Z",
    };

    my $json = JSON::Any->new;
    my $data = Data::OpenSocial::Appdata->new;
    $data->load_plugin('JSON');
    
    $data->parse_json($json->to_json($src));

    is( $data->entry->[0]->key,   'last_poke' );
    is( $data->entry->[0]->value, '2008-02-13T18:30:02Z' );
    is( $data->entry->[1]->key,   'pokes' );
    is( $data->entry->[1]->value, 3 );

    is_deeply($json->from_json($data->format_json), $src);
}

{
    my $src = +{
        entry => [
            +{ key => 'pokes', value => 3, },
            +{ key => 'last_poke', value => "2008-02-13T18:30:02Z", },
        ],
    };

    my $json = JSON::Any->new;
    my $data = Data::OpenSocial::Appdata->new;
    $data->load_plugin('JSON');
    
    $data->parse_json($json->to_json($src));

    is( $data->entry->[0]->key,   'pokes' );
    is( $data->entry->[0]->value, 3 );
    is( $data->entry->[1]->key,   'last_poke' );
    is( $data->entry->[1]->value, '2008-02-13T18:30:02Z' );

    is_deeply($json->from_json($data->format_json), $src);
}
