package Data::OpenSocial::Types;

use Any::Moose;
use Any::Moose (
    'X::Types' => [
	-declare => [
	    ### enum
	    'OpenSocial.EscapeTypeType',
	    'OpenSocial.MediaItemType',
	    'OpenSocial.DrinkerType',
	    'OpenSocial.PresenceType',
	    'OpenSocial.SmokerType',
	    'OpenSocial.CreateActivityPriorityType',
	    'OpenSocial.MessageTypeType',
	    'OpenSocial.EnvironmentType',
	    'OpenSocial.LookingForType',
	    'OpenSocial.NetworkPresenceType',
	    ### subtype
	    'OpenSocial.Account',
	    'OpenSocial.Activity',
	    'OpenSocial.ActivityTemplateParams',
	    'OpenSocial.Address',
	    'OpenSocial.Appdata',
	    'OpenSocial.Person',
	    'OpenSocial.PluralPersonField',
	    'OpenSocial.Url',
	]
    ],
    'X::Types::' . any_moose() => [qw/HashRef ArrayRef CodeRef Object Str Bool/],
);
use Any::Moose '::Util::TypeConstraints';

use Data::OpenSocial::Account;
use Data::OpenSocial::Activity;
use Data::OpenSocial::ActivityTemplateParams;
use Data::OpenSocial::Address;
use Data::OpenSocial::Appdata;
use Data::OpenSocial::Person;
use Data::OpenSocial::PluralPersonField;
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
    'OpenSocial.EscapeTypeType' => [qw/HTML_ESCAPE NONE/],
    'OpenSocial.MediaItemType'  => [qw/AUDIO IMAGE VIDEO/],
    'OpenSocial.DrinkerType' =>
	[qw/HEAVILY NO OCCASIONALLY QUIT QUITTING REGULARLY SOCIALLY YES/],
    'OpenSocial.PresenceType' => [qw/AWAY CHAT DND OFFLINE ONLINE XA/],
    'OpenSocial.SmokerType' =>
      [qw/HEAVILY NO OCCASIONALLY QUIT QUITTING REGULARLY SOCIALLY YES/],
    'OpenSocial.CreateActivityPriorityType' => [qw/HIGH LOW/],
    'OpenSocial.MessageTypeType' => [qw/EMAIL NOTIFICATION PRIVATE_MESSAGE PUBLIC_MESSAGE/],
    'OpenSocial.EnvironmentType' => [
        qw/ACTIVITY ADDRESS BODY_TYPE EMAIL FILTER_TYPE MEDIAITEM MESSAGE MESSAGE_TYPE NAME ORGANIZATION PERSON PHONE SORTORDER URL/
    ],
    'OpenSocial.LookingForType' =>
      [qw/ACTIVITY_PARTNERS DATING FRIENDS NETWORKING RANDOM RELATIONSHIP/],
    'OpenSocial.NetworkPresenceType' => [qw/AWAY CHAT DND OFFLINE ONLINE XA/],
);

our %COMPLEX_TYPES = (
    'OpenSocial.Account' => +{
	class_type => 'Data::OpenSocial::Account',
    },
    'OpenSocial.Activity' => +{
	class_type => 'Data::OpenSocial::Activity',
    },
    'OpenSocial.ActivityTemplateParams' => +{
	class_type => 'Data::OpenSocial::ActivityTemplateParams',
    },
    'OpenSocial.Address' => +{
	class_type => 'Data::OpenSocial::Address',
    },
    'OpenSocial.Appdata' => +{
	class_type => 'Data::OpenSocial::Appdata',
    },
    'OpenSocial.Person' => +{
	class_type => 'Data::OpenSocial::Person',
    },
    'OpenSocial.PluralPersonField' => +{
	class_type => 'Data::OpenSocial::PluralPersonField'
    },
    'OpenSocial.Url' => +{
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
    while (my ($type, $attrs) = each %COMPLEX_TYPES ) {
	class_type $attrs->{class_type};
	subtype $type => as $attrs->{class_type};
    }

    
#     class_type 'Data::OpenSocial::Account';
#     subtype 'OpenSocial.Account' => as 'Data::OpenSocial::Account';

#     class_type 'Data::OpenSocial::Address';
#     subtype 'OpenSocial.Address' => as 'Data::OpenSocial::Address';

#     class_type 'Data::OpenSocial::Appdata';
#     subtype 'OpenSocial.Appdata' => as 'Data::OpenSocial::Appdata';
    
#     class_type 'Data::OpenSocial::Person';
#     subtype 'OpenSocial.Person' => as 'Data::OpenSocial::Person';
#     coerce 'OpenSocial.Person'
# 	=> from 'HashRef'
# 	=> via {
# 	    Data::OpenSocial::Person->new(%$_);
# 	};

#     class_type 'Data::OpenSocial::PluralPersonField';
#     subtype 'OpenSocial.PluralPersonField' => as 'Data::OpenSocial::PluralPersonField';
    
#     class_type 'Data::OpenSocial::Url';
#     subtype 'OpenSocial.Url' => as 'Data::OpenSocial::Url';
#     coerce 'OpenSocial.Url'
# 	=> from 'HashRef'
# 	=> via {
# 	    Data::OpenSocial::Url->new(%$_);
# 	};

    # subtype 'ArrayRef[OpenSocial.Url]' => as 'ArrayRef[Object]';
    # coerce 'ArrayRef[OpenSocial.Url]'
# 	=> from 'ArrayRef[HashRef]'
# 	=> via {
# 	    my $data = shift;
# 	    my $ret = [];

# 	    for (@$data) {
# 		push(@$ret, Data::OpenSocial::Url->new(%$_));
# 	    }

# 	    $ret;
# 	};

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
