package Data::OpenSocial::Message;

use Any::Moose;
use Any::Moose ( 'X::Types::DateTime' => [qw/DateTime/], );
use Any::Moose 'X::AttributeHelpers';

use Data::OpenSocial::Types qw(Url);

with 'Data::OpenSocial::Role::AsObject';

has 'body' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_body',
);

has 'body_id' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_body_id',
);

has 'title' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_title',
);

has 'title_id' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_title_id',
);

has 'id' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_id',
);

has 'recipients' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_recipients',
);

has 'sender_id' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_sender_id',
);

has 'time_sent' => (
    is        => 'rw',
    isa       => 'DateTime',
    required  => 0,
    predicate => 'has_time_sent',
    coerce    => 1,
);

has 'in_reply_to' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_in_reply_to',
);

has 'replies' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_replies',
);

has 'status' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_status',
);

has 'app_url' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_app_url',
);

has 'collection_ids' => (
    is        => 'rw',
    isa       => 'Str',
    required  => 0,
    predicate => 'has_collection_ids',
);

has 'updated' => (
    is        => 'rw',
    isa       => 'DateTime',
    required  => 0,
    predicate => 'has_updated',
    coerce    => 1,
);

has 'urls' => (
    metaclass => 'Collection::List',
    is        => 'rw',
    isa       => 'ArrayRef[Url]',
    required  => 0,
    predicate => 'has_urls',
    provides  => +{
	count => 'count_urls',
    },
    coerce    => 1,
);

sub elements_map {
    +{
	body_id => 'bodyId',
	title_id => 'titleId',
	sender_id => 'senderId',
	time_sent => 'timeSent',
	in_reply_to => 'inReplyTo',
	app_url => 'appUrl',
	collection_ids => 'collectionIds',
    };
}

sub element_fields {
    qw(body body_id title title_id id recipients sender_id time_sent in_reply_to replies status app_url collection_ids updated urls);
}

no Any::Moose;

__PACKAGE__->meta->make_immutable;

