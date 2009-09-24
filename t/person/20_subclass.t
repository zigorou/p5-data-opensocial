use strict;
use warnings;
use lib ('./t/lib');

use Test::More;
use JSON::Any;

use Data::OpenSocial::Format::JSON;
use MyData::Person;

my $json = JSON::Any->new;

{
    my $src = +{
        id          => 'example.org:34KJDCSKJN2HHF0DW20394',
        displayName => "Janey",
        name        => +{ formatted => 'Jane Doe' },
        gender      => 'female',
        age         => 25,
        jobType     => 'programmer',
    };

    my $person = MyData::Person->new($src);

    isa_ok( $person, 'Data::OpenSocial::Person' );

    is( $person->id,           $src->{id},          'id attr' );
    is( $person->display_name, $src->{displayName}, 'display_name attr' );
    is(
        $person->name->formatted,
        $src->{name}{formatted},
        'name/formatted attr'
    );
    is( $person->gender,   $src->{gender},  'gender attr' );
    is( $person->age,      $src->{age},     'age extended attr' );
    is( $person->job_type, $src->{jobType}, 'job_type extended attr' );

    my $json_str = Data::OpenSocial::Format::JSON->format($person);
    note($json_str);

    is_deeply( scalar $json->from_json($json_str), $src, 'format JSON' );
}

done_testing;
