package Data::OpenSocial::Person;

use Any::Moose;
use Any::Moose 'X::Types::DateTime';
use Data::OpenSocial::Types qw(
    OpenSocial.Account
    OpenSocial.Address
    OpenSocial.Appdata
    OpenSocial.PluralPersonField
);

extends 'Data::OpenSocial::Base';
with 'Data::OpenSocial::Role::AsObject';

do {
    my @element_fields = (
        +{
            field     => 'about_me',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'accounts',
            is        => 'rw',
            isa       => 'OpenSocial.Account',
            required  => 0,
        },
        +{
            field     => 'activities',
            is        => 'rw',
            isa       => 'ArrayRef[Str]',
            required  => 0,
        },
        +{
            field     => 'addresses',
            is        => 'rw',
            isa       => 'ArrayRef[OpenSocial.Address]',
            required  => 0,
        },
        +{
            field     => 'age',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'anniversary',
            is        => 'rw',
            isa       => 'DateTime',
            required  => 0,
        },
        +{
            field     => 'app_data',
            is        => 'rw',
            isa       => 'OpenSocial.Appdata',
            required  => 0,
        },
        +{
            field     => 'birthday',
            is        => 'rw',
            isa       => 'DateTime',
            required  => 0,
        },
        +{
            field     => 'body_type',
            is        => 'rw',
            isa       => 'OpenSocial.BodyType',
            required  => 0,
        },
        +{
            field     => 'books',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'cars',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'children',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'connected',
            is        => 'rw',
            isa       => 'OpenSocial.Presence',
            required  => 0,
        },
        +{
            field     => 'current_location',
            is        => 'rw',
            isa       => 'OpenSocial.Address',
            required  => 0,
        },
        +{
            field     => 'display_name',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'drinker',
            is        => 'rw',
            isa       => 'OpenSocial.Drinker',
            required  => 0,
        },
        +{
            field     => 'emails',
            is        => 'rw',
            isa       => 'OpenSocial.PluralPersonField',
            required  => 0,
        },
        +{
            field     => 'ethnicity',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'fashion',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'food',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'gender',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'happiest_when',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
	},
        +{
            field     => 'has_app',
            is        => 'rw',
            isa       => 'Bool',
            required  => 0,
        },
        +{
            field     => 'heroes',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'humor',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'id',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'ims',
            is        => 'rw',
            isa       => 'OpenSocial.PluralPersonField',
            required  => 0,
        },
        +{
            field     => 'interests',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'job_interests',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'languages_spoken',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'living_arrangement',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'looking_for',
            is        => 'rw',
            isa       => 'LookingFor',
            required  => 0,
        },
        +{
            field     => 'movies',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'music',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'name',
            is        => 'rw',
            isa       => 'OpenSocial.Name',
            required  => 0,
        },
        +{
            field     => 'network_presence',
            is        => 'rw',
            isa       => 'OpenSocial.NetworkPresence',
            required  => 0,
        },
        +{
            field     => 'nickname',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'organizations',
            is        => 'rw',
            isa       => 'OpenSocial.Organization',
            required  => 0,
        },
        +{
            field     => 'pets',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'phone_numbers',
            is        => 'rw',
            isa       => 'OpenSocial.PluralPersonField',
            required  => 0,
        },
        +{
            field     => 'photos',
            is        => 'rw',
            isa       => 'OpenSocial.PluralPersonField',
            required  => 0,
        },
        +{
            field     => 'political_views',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'preferred_username',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'profile_song',
            is        => 'rw',
            isa       => 'OpenSocial.Url',
            required  => 0,
        },
        +{
            field     => 'profile_url',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'profile_video',
            is        => 'rw',
            isa       => 'OpenSocial.Url',
            required  => 0,
        },
        +{
            field     => 'published',
            is        => 'rw',
            isa       => 'DateTime',
            required  => 0,
        },
        +{
            field     => 'quotes',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'relationships',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'relationship_status',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'religion',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'romance',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'scared_of',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'sexual_orientation',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'smoker',
            is        => 'rw',
            isa       => 'OpenSocial.Smoker',
            required  => 0,
        },
        +{
            field     => 'sports',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'status',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'tags',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'thumbnail_url',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'turn_offs',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'turn_ons',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'tv_shows',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'updated',
            is        => 'rw',
            isa       => 'DateTime',
            required  => 0,
        },
        +{
            field     => 'urls',
            is        => 'rw',
            isa       => 'OpenSocial.Url',
            required  => 0,
        },
        +{
            field     => 'utc_offset',
            is        => 'rw',
            isa       => 'Int',
            required  => 0,
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while (my ($field, $attr) = each %attrs) {
	has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

