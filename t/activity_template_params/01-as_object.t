use Test::More;
use Data::OpenSocial::ActivityTemplateParams;

plan tests => 1;

{
    my $atp = Data::OpenSocial::ActivityTemplateParams->new(
	person_key => 'ZGR',
	person_key_display_name => 'zigorou',
	person_key_id => '100',
	person_key_profile_url => 'http://xri.net/=zigorou',
	person => +{
	    age => '13',
	},
    );

    is_deeply($atp->as_object, +{
	'PersonKey' => 'ZGR',
	'PersonKey.DisplayName' => 'zigorou',
	'PersonKey.Id' => '100',
	'PersonKey.ProfileUrl' => 'http://xri.net/=zigorou',
	person => +{
	    age => '13',
	},
    });
}

