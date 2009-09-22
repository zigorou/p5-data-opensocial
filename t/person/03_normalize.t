use strict;
use warnings;

use Test::More;
use Data::OpenSocial::Person;

{
    my $data = Data::OpenSocial::Person->new(
        id          => 100,
        displayName => 'Jeney',
        nickname    => 'JJ',
        aboutMe     => 'Hello World',
        age         => undef,
    );

    is($data->id, 100, 'normal attr : id');
    is($data->display_name, 'Jeney', 'transform attr : display_name');
    is($data->nickname, 'JJ', 'transform attr : nickname');
    is($data->about_me, 'Hello World', 'normal attr : about_me');
    is($data->age, undef, 'normal attr with undef initialize : age');
    is($data->interests, undef, 'normal attr no initialize : interests');
}

{
    my $data = Data::OpenSocial::Person->new(+{
        id          => 100,
        displayName => 'Jeney',
        nickname    => 'JJ',
        aboutMe     => 'Hello World',
        age         => undef,
    });

    is($data->id, 100, 'normal attr : id');
    is($data->display_name, 'Jeney', 'transform attr : display_name');
    is($data->nickname, 'JJ', 'transform attr : nickname');
    is($data->about_me, 'Hello World', 'normal attr : about_me');
    is($data->age, undef, 'normal attr with undef initialize : age');
    is($data->interests, undef, 'normal attr no initialize : interests');
}


done_testing;
