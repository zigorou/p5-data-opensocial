use Test::More;
use Data::OpenSocial::Account;

plan tests => 5 * 2;

our %defaults = (
    domain    => 'example.com',
    primary   => 1,
    user_id   => 'zigorou',
    user_name => 'ZIGOROU',
);

{
    my $data = Data::OpenSocial::Account->new;
    isa_ok($data, 'Data::OpenSocial::Account');

    for my $attr (keys %defaults) {
        $data->$attr($defaults{$attr});
        is($data->$attr, $defaults{$attr}, $attr . ' attr');
    }
}

{
    my $data = Data::OpenSocial::Account->new(%defaults);
    isa_ok($data, 'Data::OpenSocial::Account');

    for my $attr (keys %defaults) {
        is($data->$attr, $defaults{$attr}, $attr . ' attr');
    }
}
