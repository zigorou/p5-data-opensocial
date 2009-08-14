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
	    # 'Person',
	    # 'Address',
	    'Url',
	]
    ],
    'X::Types::' . any_moose() => [qw/HashRef ArrayRef CodeRef Object Str Bool/],
);
use Any::Moose '::Util::TypeConstraints';

use Data::OpenSocial::Address;
use Data::OpenSocial::Person;
use Data::OpenSocial::Url;

our %PREMITIVE_TYPES = (
    Str	 => 1,
    Bool => 1,
    Int	 => 1,
);

our %IMPORTED_TYPES = (
    DateTime => 1,
);

our %SIMPLE_TYPES = (
    EscapeTypeType => [qw/HTML_ESCAPE NONE/],
    MediaItemType  => [qw/AUDIO IMAGE VIDEO/],
    DrinkerType =>
      [qw/HEAVILY NO OCCASIONALLY QUIT QUITTING REGULARLY SOCIALLY YES/],
    PresenceType => [qw/AWAY CHAT DND OFFLINE ONLINE XA/],
    SmokerType =>
      [qw/HEAVILY NO OCCASIONALLY QUIT QUITTING REGULARLY SOCIALLY YES/],
    CreateActivityPriorityType => [qw/HIGH LOW/],
    MessageTypeType => [qw/EMAIL NOTIFICATION PRIVATE_MESSAGE PUBLIC_MESSAGE/],
    EnvironmentType => [
        qw/ACTIVITY ADDRESS BODY_TYPE EMAIL FILTER_TYPE MEDIAITEM MESSAGE MESSAGE_TYPE NAME ORGANIZATION PERSON PHONE SORTORDER URL/
    ],
    LookingForType =>
      [qw/ACTIVITY_PARTNERS DATING FRIENDS NETWORKING RANDOM RELATIONSHIP/],
    NetworkPresenceType => [qw/AWAY CHAT DND OFFLINE ONLINE XA/],
);

our %COMPLEX_TYPES = (
    Address => +{
	class_type => 'Data::OpenSocial::Address',
    },
    Url => +{
	class_type => 'Data::OpenSocial::Url',
    },
);

sub is_primitive_type {
    my ($class, $type) = @_;
    exists $PREMITIVE_TYPES{$type};
}

sub is_imported_type {
    my ($class, $type) = @_;
    exists $IMPORTED_TYPES{$type};
}

sub is_simple_type {
    my ($class, $type) = @_;
    exists $SIMPLE_TYPES{$type};
}

sub is_complex_type {
    my ($class, $type) = @_;
    exists $COMPLEX_TYPES{$type};
}

do {
    while ( my ($type, $enums) = each %SIMPLE_TYPES ) {
	enum $type => @$enums;
    }
};

do {
#     class_type 'Data::OpenSocial::Address';
#     subtype 'Address' => as 'Data::OpenSocial::Address';

#     class_type 'Data::OpenSocial::Person';
#     subtype 'Person' => as 'Data::OpenSocial::Person';

#     class_type 'Data::OpenSocial::Url';
#     subtype 'Url' => as 'Data::OpenSocial::Url';

    coerce 'Url'
	=> from 'HashRef'
	=> via {
	    Data::OpenSocial::Url->new(%$_);
	};

    subtype 'ArrayRef[Url]' => as 'ArrayRef[Object]';

    coerce 'ArrayRef[Url]'
	=> from 'ArrayRef[HashRef]'
	=> via {
	    my $data = shift;
	    my $ret = [];

	    for (@$data) {
		push(@$ret, Data::OpenSocial::Url->new(%$_));
	    }

	    $ret;
	};
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
