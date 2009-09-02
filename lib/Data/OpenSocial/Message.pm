package Data::OpenSocial::Message;

use Any::Moose;
use Any::Moose ( 'X::Types::DateTime' => [qw/DateTime/], );
use Any::Moose 'X::AttributeHelpers';

use Data::OpenSocial::Types qw(
  OpenSocial.Url
  OpenSocial.Url.Collection
  OpenSocial.MessageType
);

extends 'Data::OpenSocial::Base';

do {
    my @element_fields = (
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'body',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'body_id',
            typemap   => 'bodyId',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'title',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'title_id',
            typemap   => 'titleId',
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
            field     => 'recipients',
            is        => 'rw',
            isa       => 'ArrayRef[Str]',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'sender_id',
            typemap   => 'senderId',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'time_sent',
            typemap   => 'timeSent',
            is        => 'rw',
            isa       => 'DateTime',
            required  => 0,
            coerce    => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'in_reply_to',
            typemap   => 'inReplyTo',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'replies',
            is        => 'rw',
            isa       => 'ArrayRef[Str]',
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
            field     => 'app_url',
            typemap   => 'appUrl',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'collection_ids',
            typemap   => 'collectionIds',
            is        => 'rw',
            isa       => 'ArrayRef[Str]',
            required  => 0,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'updated',
            is        => 'rw',
            isa       => 'DateTime',
            required  => 0,
            coerce    => 1,
        },
        +{
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'urls',
            metaclass => 'Collection::List',
            is        => 'rw',
            isa       => 'OpenSocial.Url.Collection',
            required  => 0,
            provides  => +{ count => 'count_urls', },
            coerce    => 1,
        },
        +{ ### specs is wrong
            namespace => 'http://ns.opensocial.org/2008/opensocial',
            field     => 'type',
            is        => 'rw',
            isa       => 'OpenSocial.MessageType',
            required  => 0,
        }
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

