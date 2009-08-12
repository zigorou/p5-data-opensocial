package Data::OpenSocial::Person;

use Any::Moose;

has 'about_me' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_about_me',
);

has 'accounts' => (
    is        => 'rw',
    isa       => 'Account',
    required  => 0,
    predicate => 'has_accounts',
);

has 'activities' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_activities',
);

has 'addresses' => (
    is        => 'rw',
    isa       => 'Address',
    required  => 0,
    predicate => 'has_addresses',
);

has 'age' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_age',
);

has 'anniversary' => (
    is        => 'rw',
    isa       => 'Datetime',
    required  => 0,
    predicate => 'has_anniversary',
);

has 'app_data' => (
    is        => 'rw',
    isa       => 'Appdata',
    required  => 0,
    predicate => 'has_app_data',
);

has 'birthday' => (
    is        => 'rw',
    isa       => 'Datetime',
    required  => 0,
    predicate => 'has_birthday',
);

has 'body_type' => (
    is        => 'rw',
    isa       => 'BodyType',
    required  => 0,
    predicate => 'has_body_type',
);

has 'books' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_books',
);

has 'cars' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_cars',
);

has 'children' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_children',
);

has 'connected' => (
    is        => 'rw',
    isa       => 'Presence',
    required  => 0,
    predicate => 'has_connected',
);

has 'current_location' => (
    is        => 'rw',
    isa       => 'Address',
    required  => 0,
    predicate => 'has_current_location',
);

has 'display_name' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_display_name',
);

has 'drinker' => (
    is        => 'rw',
    isa       => 'Drinker',
    required  => 0,
    predicate => 'has_drinker',
);

has 'emails' => (
    is        => 'rw',
    isa       => 'PluralPersonField',
    required  => 0,
    predicate => 'has_emails',
);

has 'ethnicity' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_ethnicity',
);

has 'fashion' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_fashion',
);

has 'food' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_food',
);

has 'gender' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_gender',
);

has 'happiest_when' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_happiest_when',
);

has 'has_app' => (
    is        => 'rw',
    isa       => 'Bool',
    required  => 0,
    predicate => 'has_has_app',
);

has 'heroes' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_heroes',
);

has 'humor' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_humor',
);

has 'id' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_id',
);

has 'ims' => (
    is        => 'rw',
    isa       => 'PluralPersonField',
    required  => 0,
    predicate => 'has_ims',
);

has 'interests' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_interests',
);

has 'job_interests' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_job_interests',
);

has 'languages_spoken' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_languages_spoken',
);

has 'living_arrangement' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_living_arrangement',
);

has 'looking_for' => (
    is        => 'rw',
    isa       => 'LookingFor',
    required  => 0,
    predicate => 'has_looking_for',
);

has 'movies' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_movies',
);

has 'music' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_music',
);

has 'name' => (
    is        => 'rw',
    isa       => 'Name',
    required  => 0,
    predicate => 'has_name',
);

has 'network_presence' => (
    is        => 'rw',
    isa       => 'NetworkPresence',
    required  => 0,
    predicate => 'has_network_presence',
);

has 'nickname' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_nickname',
);

has 'organizations' => (
    is        => 'rw',
    isa       => 'Organization',
    required  => 0,
    predicate => 'has_organizations',
);

has 'pets' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_pets',
);

has 'phone_numbers' => (
    is        => 'rw',
    isa       => 'PluralPersonField',
    required  => 0,
    predicate => 'has_phone_numbers',
);

has 'photos' => (
    is        => 'rw',
    isa       => 'PluralPersonField',
    required  => 0,
    predicate => 'has_photos',
);

has 'political_views' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_political_views',
);

has 'preferred_username' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_preferred_username',
);

has 'profile_song' => (
    is        => 'rw',
    isa       => 'Url',
    required  => 0,
    predicate => 'has_profile_song',
);

has 'profile_url' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_profile_url',
);

has 'profile_video' => (
    is        => 'rw',
    isa       => 'Url',
    required  => 0,
    predicate => 'has_profile_video',
);

has 'published' => (
    is        => 'rw',
    isa       => 'Datetime',
    required  => 0,
    predicate => 'has_published',
);

has 'quotes' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_quotes',
);

has 'relationships' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_relationships',
);

has 'relationship_status' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_relationship_status',
);

has 'religion' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_religion',
);

has 'romance' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_romance',
);

has 'scared_of' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_scared_of',
);

has 'sexual_orientation' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_sexual_orientation',
);

has 'smoker' => (
    is        => 'rw',
    isa       => 'Smoker',
    required  => 0,
    predicate => 'has_smoker',
);

has 'sports' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_sports',
);

has 'status' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_status',
);

has 'tags' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_tags',
);

has 'thumbnail_url' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_thumbnail_url',
);

has 'turn_offs' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_turn_offs',
);

has 'turn_ons' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_turn_ons',
);

has 'tv_shows' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_tv_shows',
);

has 'updated' => (
    is        => 'rw',
    isa       => 'Datetime',
    required  => 0,
    predicate => 'has_updated',
);

has 'urls' => (
    is        => 'rw',
    isa       => 'Url',
    required  => 0,
    predicate => 'has_urls',
);

has 'utc_offset' => (
    is        => 'rw',
    isa       => 'Int',
    required  => 0,
    predicate => 'has_utc_offset',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;


