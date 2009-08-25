use Test::More;
use Data::OpenSocial::Account;

plan tests => 1;


{
    my $account = Data::OpenSocial::Account->new(
	domain    => 'www.example.com',
	primary   => 1,
	user_id   => 'zigorou',
	user_name => 'Toru Yamaguchi',
    );

    is_deeply(
	$account->as_object,
	+{
	    domain => 'www.example.com',
	    primary   => 1,
	    userid   => 'zigorou',
	    username => 'Toru Yamaguchi',
	},
	'',
    );
}

