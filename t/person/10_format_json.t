use strict;
use Test::More;

use JSON::Any;
use Data::OpenSocial::Person;
use Data::OpenSocial::Format::JSON;

plan tests => 6 * 1;

diag('refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.3.2');

{
    my $src = +{
        id           => 'example.org:34KJDCSKJN2HHF0DW20394',
        displayName => "Janey",
        name         => +{ formatted => 'Jane Doe' },
        gender       => 'female',
    };

    my $json = JSON::Any->new;
    my $data = Data::OpenSocial::Format::JSON->parse( 'Person', $json->to_json($src) );

    isa_ok($data, 'Data::OpenSocial::Person');
    
    is( $data->id, $src->{id}, 'id' );
    is( $data->display_name, $src->{displayName}, 'displayName' );
    is( $data->name->formatted, $src->{name}{formatted}, 'name' );
    is( $data->gender, $src->{gender}, 'gender' );

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);
    is_deeply( scalar $json->from_json($json_str), $src, 'format json' );
}
