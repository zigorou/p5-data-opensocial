use strict;
use Test::More;

use JSON::Any;
use Data::OpenSocial::Message;
use Data::OpenSocial::Format::JSON;

plan tests => 11 * 1;

{
    diag(
        'refer to http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/REST-API.html#rfc.section.10.2'
    );
    
    my $src = +{
        id => 'http://example.org/inbox/message/{msgid}',
        recipients =>
            [ 'example.org:AD38B3886625AAF', 'example.org:997638BAA6F25AD' ],
        senderId => 'example.org:34KJDCSKJN2HHF0DW20394',
        title     => 'You have a new messge from Joe',
        titleId  => '541141091700',
        body      => 'Short message from Joe to some friends',
        bodyId   => '5491155811231',
        type      => 'PRIVATE_MESSAGE',
        status    => 'unread',
        # data => '...'
    };

    my $json = JSON::Any->new;
    my $data =
      Data::OpenSocial::Format::JSON->parse( 'Message',
        $json->to_json($src) );

    isa_ok( $data, 'Data::OpenSocial::Message' );

    is($data->id, $src->{id}, 'id');
    is_deeply($data->recipients, $src->{recipients}, 'recipients');
    is($data->sender_id, $src->{senderId}, 'sender_id');
    is($data->title, $src->{title}, 'title');
    is($data->title_id, $src->{titleId}, 'title_id');
    is($data->body, $src->{body}, 'body');
    is($data->body_id, $src->{bodyId}, 'body_id');
    is($data->type, $src->{type}, 'type');
    is($data->status, $src->{status}, 'status');

    my $json_str = Data::OpenSocial::Format::JSON->format($data);
    note($json_str);
    is_deeply( scalar $json->from_json($json_str), $src, 'format json' );
}
