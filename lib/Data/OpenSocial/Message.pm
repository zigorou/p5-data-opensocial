package Data::OpenSocial::Message;

use Any::Moose;
use Any::Moose ( 'X::Types::DateTime' => [qw/DateTime/], );
use Any::Moose 'X::AttributeHelpers';

use Data::OpenSocial::Types qw(OpenSocial.Url);

extends 'Data::OpenSocial::Base';
with 'Data::OpenSocial::Role::AsObject';

do {
    my @element_fields = (
        +{
            field     => 'body',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_body',
        },
        +{
            field     => 'body_id',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_body_id',
        },
        +{
            field     => 'title',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_title',
        },
        +{
            field     => 'title_id',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_title_id',
        },
        +{
            field     => 'id',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_id',
        },
        +{
            field     => 'recipients',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_recipients',
        },
        +{
            field     => 'sender_id',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_sender_id',
        },
        +{
            field     => 'time_sent',
            is        => 'rw',
            isa       => 'DateTime',
            required  => 0,
            predicate => 'has_time_sent',
            coerce    => 1,
        },
        +{
            field     => 'in_reply_to',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_in_reply_to',
        },
        +{
            field     => 'replies',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_replies',
        },
        +{
            field     => 'status',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_status',
        },
        +{
            field     => 'app_url',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_app_url',
        },
        +{
            field     => 'collection_ids',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_collection_ids',
        },
        +{
            field     => 'updated',
            is        => 'rw',
            isa       => 'DateTime',
            required  => 0,
            predicate => 'has_updated',
            coerce    => 1,
        },
        +{
            field     => 'urls',
            metaclass => 'Collection::List',
            is        => 'rw',
            isa       => 'ArrayRef[Url]',
            required  => 0,
            predicate => 'has_urls',
            provides  => +{ count => 'count_urls', },
            coerce    => 1,
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ($field, $attr) = each %attrs ) {
	has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

