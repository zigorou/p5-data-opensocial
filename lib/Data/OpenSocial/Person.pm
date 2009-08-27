package Data::OpenSocial::Person;

use Any::Moose;
use Any::Moose 'X::Types::DateTime';
use Data::OpenSocial::Types qw(
  OpenSocial.Account
  OpenSocial.Address
  OpenSocial.Appdata
  OpenSocial.BodyType
  OpenSocial.Drinker
  OpenSocial.Name
  OpenSocial.NetworkPresence
  OpenSocial.Organization
  OpenSocial.Presence
  OpenSocial.PluralPersonField
  OpenSocial.Smoker
  OpenSocial.Url
);

extends 'Data::OpenSocial::Base';

do {
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'about_me',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'accounts',
            is        => 'rw',
            isa       => 'OpenSocial.Account',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'activities',
            is        => 'rw',
            isa       => 'ArrayRef[Str]',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'addresses',
            is        => 'rw',
            isa       => 'ArrayRef[OpenSocial.Address]',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'age',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'anniversary',
            is        => 'rw',
            isa       => 'DateTime',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'app_data',
            is        => 'rw',
            isa       => 'OpenSocial.Appdata',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'birthday',
            is        => 'rw',
            isa       => 'DateTime',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'body_type',
            is        => 'rw',
            isa       => 'OpenSocial.BodyType',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'books',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'cars',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'children',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'connected',
            is        => 'rw',
            isa       => 'OpenSocial.Presence',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'current_location',
            is        => 'rw',
            isa       => 'OpenSocial.Address',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'display_name',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'drinker',
            is        => 'rw',
            isa       => 'OpenSocial.Drinker',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'emails',
            is        => 'rw',
            isa       => 'OpenSocial.PluralPersonField',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'ethnicity',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'fashion',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'food',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'gender',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'happiest_when',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'has_app',
            is        => 'rw',
            isa       => 'Bool',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'heroes',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'humor',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'id',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'ims',
            is        => 'rw',
            isa       => 'OpenSocial.PluralPersonField',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'interests',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'job_interests',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'languages_spoken',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'living_arrangement',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'looking_for',
            is        => 'rw',
            isa       => 'LookingFor',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'movies',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'music',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'name',
            is        => 'rw',
            isa       => 'OpenSocial.Name',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'network_presence',
            is        => 'rw',
            isa       => 'OpenSocial.NetworkPresence',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'nickname',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'organizations',
            is        => 'rw',
            isa       => 'OpenSocial.Organization',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'pets',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'phone_numbers',
            is        => 'rw',
            isa       => 'OpenSocial.PluralPersonField',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'photos',
            is        => 'rw',
            isa       => 'OpenSocial.PluralPersonField',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'political_views',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'preferred_username',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'profile_song',
            is        => 'rw',
            isa       => 'OpenSocial.Url',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'profile_url',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'profile_video',
            is        => 'rw',
            isa       => 'OpenSocial.Url',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'published',
            is        => 'rw',
            isa       => 'DateTime',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'quotes',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'relationships',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'relationship_status',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'religion',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'romance',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'scared_of',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'sexual_orientation',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'smoker',
            is        => 'rw',
            isa       => 'OpenSocial.Smoker',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'sports',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'status',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'tags',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'thumbnail_url',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'turn_offs',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'turn_ons',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'tv_shows',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'updated',
            is        => 'rw',
            isa       => 'DateTime',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'urls',
            is        => 'rw',
            isa       => 'OpenSocial.Url',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'utc_offset',
            is        => 'rw',
            isa       => 'Int',
            required  => 0,
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

