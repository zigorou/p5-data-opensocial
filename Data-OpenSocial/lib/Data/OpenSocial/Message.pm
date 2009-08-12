package Data::OpenSocial::Message;

use Any::Moose;
use Data::OpenSocial::Types qw(Datetime);

has 'body' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
);

has 'body_id' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
);

has 'title' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
);

has 'title_id' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
);

has 'id' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
);

has 'recipients' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
);

has 'sender_id' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
);

has 'time_sent' => (
    is	      => 'rw',
    isa	      => 'Datetime',
    required  => 0,
);

has 'in_reply_to' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
);

has 'replies' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
);

has 'status' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
);

has 'app_url' => (
    is	      => 'rw',
    isa	      => 'Str', ### TODO
    required  => 0,
);

has 'collection_ids' => (
    is	      => 'rw',
    isa	      => 'Str',
    required  => 0,
);

has 'updated' => (
    is	      => 'rw',
    isa	      => 'Datetime',
    required  => 0,
);

has 'urls' => (
    is	      => 'rw',
    isa	      => 'ArrayRef[Str]', ### TODO
    required  => 0,
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;

