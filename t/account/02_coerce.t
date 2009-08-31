use strict;
use Test::More;
use Data::OpenSocial::Account;

plan tests => 5;

{
    package Test::Data::OpenSocial::Account::IsaType;

    use Any::Moose;
    use Data::OpenSocial::Types qw(OpenSocial.Account);

    has 'account' => (
        is     => 'rw',
        isa    => 'OpenSocial.Account',
        coerce => 1,
    );
    
    no Any::Moose;

    __PACKAGE__->meta->make_immutable;
}

{
    my $type_class = Test::Data::OpenSocial::Account::IsaType->new(
        account => +{
            domain    => 'example.com',
            primary   => 1,
            user_id   => 'zigorou',
            user_name => 'ZIGOROU',
        },
    );

    my $data = $type_class->account;
    
    isa_ok($data, 'Data::OpenSocial::Account');
    is($data->domain, 'example.com', 'domain attr');
    is($data->primary, 1, 'primary attr');
    is($data->user_id, 'zigorou', 'user_id attr');
    is($data->user_name, 'ZIGOROU', 'user_name attr');
}

