package Data::OpenSocial::Types;

use Any::Moose;
use Any::Moose (
    'X::Types' => [
	-declare => [
	    ### enum
	    'EscapeTypeType',
	    'MediaItemType',
	    'DrinkerType',
	    'PresenceType',
	    'SmokerType',
	    'CreateActivityPriorityType',
	    'MessageTypeType',
	    'EnvironmentType',
	    'LookingForType',
	    'NetworkPresenceType',
	    ### subtype
	    'Datetime',
	]
    ],
    'Uri::Types::' . any_moose() => [qw/HashRef ArrayRef CodeRef Object Str Bool/],
);

use DateTime;
use URI;

enum 'EscapeTypeType' => qw(
    HTML_ESCAPE
    NONE
);

enum 'MediaItemType' => qw(
    AUDIO
    IMAGE
    VIDEO
);

enum 'DrinkerType' => qw(
    HEAVILY
    NO
    OCCASIONALLY
    QUIT
    QUITTING
    REGULARLY
    SOCIALLY
    YES
);

enum 'PresenceType' => qw(
    AWAY
    CHAT
    DND
    OFFLINE
    ONLINE
    XA
);

enum 'SmokerType' => qw(
    HEAVILY
    NO
    OCCASIONALLY
    QUIT
    QUITTING
    REGULARLY
    SOCIALLY
    YES
);

enum 'CreateActivityPriorityType' => qw(
    HIGH
    LOW
);

enum 'MessageTypeType' => qw(
    EMAIL
    NOTIFICATION
    PRIVATE_MESSAGE
    PUBLIC_MESSAGE
);

enum 'EnvironmentType' => qw(
    ACTIVITY
    ADDRESS
    BODY_TYPE
    EMAIL
    FILTER_TYPE
    MEDIAITEM
    MESSAGE
    MESSAGE_TYPE
    NAME
    ORGANIZATION
    PERSON
    PHONE
    SORTORDER
    URL
);

enum 'LookingForType' => qw(
    ACTIVITY_PARTNERS
    DATING
    FRIENDS
    NETWORKING
    RANDOM
    RELATIONSHIP
);

enum 'NetworkPresenceType' => qw(
    AWAY
    CHAT
    DND
    OFFLINE
    ONLINE
    XA
);

subtype 'Datetime' =>
    as 'DateTime';

coerce 'Datetime' =>
    from 'Int',
    via {
	DateTime->from_epoch( epoch => $_ );
    };

no Any::Moose;

__PACKAGE__->meta->make_immutable;

__END__

=head1 NAME

Data::OpenSocial::Types -

=head1 SYNOPSIS

  use Data::OpenSocial::Types;

=head1 DESCRIPTION

Data::OpenSocial is

=head1 TYPES

=head2 NetworkPresenceType

  <xs:simpleType name="NetworkPresenceType">
    <xs:restriction base="xs:string">
      <xs:enumeration value="AWAY" />
      <xs:enumeration value="CHAT" />
      <xs:enumeration value="DND" />
      <xs:enumeration value="OFFLINE" />
      <xs:enumeration value="ONLINE" />
      <xs:enumeration value="XA" />
    </xs:restriction>
  </xs:simpleType>

=head1 AUTHOR

Toru Yamaguchi E<lt>zigorou@cpan.orgE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
