use strict;
use Test::More;

use Data::OpenSocial::Message;

plan tests => 10 * 1;

{
    package Test::Data::OpenSocial::Message::IsaType;

    use Any::Moose;
    use Data::OpenSocial::Types qw(OpenSocial.Message);

    has 'data' => (
        is     => 'rw',
        isa    => 'OpenSocial.Message',
        coerce => 1,
    );

    no Any::Moose;

    __PACKAGE__->meta->make_immutable;
}

our %defaults = (
    id => 'http://example.org/inbox/message/{msgid}',
    recipients =>
      [ 'example.org:AD38B3886625AAF', 'example.org:997638BAA6F25AD' ],
    sender_id => 'example.org:34KJDCSKJN2HHF0DW20394',
    title     => 'You have a new messge from Joe',
    title_id  => '541141091700',
    body      => 'Short message from Joe to some friends',
    body_id   => '5491155811231',
    type      => 'PRIVATE_MESSAGE',
    status    => 'unread',
    # data => '...'
);

{
    my $type_class = Test::Data::OpenSocial::Message::IsaType->new( data => \%defaults );

    my $data = $type_class->data;

    isa_ok($data, 'Data::OpenSocial::Message');

    is($data->id, $defaults{id}, 'id');
    is_deeply($data->recipients, $defaults{recipients}, 'recipients');
    is($data->sender_id, $defaults{sender_id}, 'sender_id');
    is($data->title, $defaults{title}, 'title');
    is($data->title_id, $defaults{title_id}, 'title_id');
    is($data->body, $defaults{body}, 'body');
    is($data->body_id, $defaults{body_id}, 'body_id');
    is($data->type, $defaults{type}, 'type');
    is($data->status, $defaults{status}, 'status');
}
