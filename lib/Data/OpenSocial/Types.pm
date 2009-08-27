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
            'OpenSocial.AppdataEntry',
            'OpenSocial.BodyType',
            'OpenSocial.Drinker',
            'OpenSocial.MediaItem',
            'OpenSocial.Name',
            'OpenSocial.NetworkPresence',
            'OpenSocial.Organization',
            'OpenSocial.Person',
            'OpenSocial.PluralPersonField',
            'OpenSocial.Presence',
            'OpenSocial.Smoker',
            'OpenSocial.Url',
        ]
    ],
    'X::Types::'
      . any_moose() => [qw/HashRef ArrayRef CodeRef Object Str Bool/],
);
use Any::Moose '::Util::TypeConstraints';

use UNIVERSAL::require;

our %PREMITIVE_TYPES = (
    Str  => 1,
    Bool => 1,
    Int  => 1,
);

our %IMPORTED_TYPES = ( DateTime => 1, );

our %SIMPLE_TYPES = (
    'OpenSocial.EscapeTypeType' => [qw/HTML_ESCAPE NONE/],
    'OpenSocial.MediaItemType'  => [qw/AUDIO IMAGE VIDEO/],
    'OpenSocial.DrinkerType' =>
      [qw/HEAVILY NO OCCASIONALLY QUIT QUITTING REGULARLY SOCIALLY YES/],
    'OpenSocial.PresenceType' => [qw/AWAY CHAT DND OFFLINE ONLINE XA/],
    'OpenSocial.SmokerType' =>
      [qw/HEAVILY NO OCCASIONALLY QUIT QUITTING REGULARLY SOCIALLY YES/],
    'OpenSocial.CreateActivityPriorityType' => [qw/HIGH LOW/],
    'OpenSocial.MessageTypeType' =>
      [qw/EMAIL NOTIFICATION PRIVATE_MESSAGE PUBLIC_MESSAGE/],
    'OpenSocial.EnvironmentType' => [
        qw/ACTIVITY ADDRESS BODY_TYPE EMAIL FILTER_TYPE MEDIAITEM MESSAGE MESSAGE_TYPE NAME ORGANIZATION PERSON PHONE SORTORDER URL/
    ],
    'OpenSocial.LookingForType' =>
      [qw/ACTIVITY_PARTNERS DATING FRIENDS NETWORKING RANDOM RELATIONSHIP/],
    'OpenSocial.NetworkPresenceType' => [qw/AWAY CHAT DND OFFLINE ONLINE XA/],
);

our %COMPLEX_TYPES = (
    'OpenSocial.Account'  => +{ class_type => 'Data::OpenSocial::Account', },
    'OpenSocial.Activity' => +{ class_type => 'Data::OpenSocial::Activity', },
    'OpenSocial.ActivityTemplateParams' =>
      +{ class_type => 'Data::OpenSocial::ActivityTemplateParams', },
    'OpenSocial.Address' => +{ class_type => 'Data::OpenSocial::Address', },
    'OpenSocial.Appdata' => +{ class_type => 'Data::OpenSocial::Appdata', },
    'OpenSocial.AppdataEntry' =>
      +{ class_type => 'Data::OpenSocial::AppdataEntry', },
    'OpenSocial.BodyType'  => +{ class_type => 'Data::OpenSocial::BodyType', },
    'OpenSocial.Drinker'   => +{ class_type => 'Data::OpenSocial::Drinker', },
    'OpenSocial.Mediaitem' => +{ class_type => 'Data::OpenSocial::MediaItem', },
    'OpenSocial.Name'      => +{ class_type => 'Data::OpenSocial::Name', },
    'OpenSocial.NetworkPresence' =>
      +{ class_type => 'Data::OpenSocial::NetworkPresence', },
    'OpenSocial.Organization' =>
      +{ class_type => 'Data::OpenSocial::Organization', },
    'OpenSocial.Person' => +{
        class_type => 'Data::OpenSocial::Person',
        coerce     => [
            from 'HashRef',
            via {
                Data::OpenSocial::Person->require;
                Data::OpenSocial::Person->new(%$_);
            },
        ]
    },
    'OpenSocial.PluralPersonField' =>
      +{ class_type => 'Data::OpenSocial::PluralPersonField' },
    'OpenSocial.Presence' => +{ class_type => 'Data::OpenSocial::Presence', },
    'OpenSocial.Smoker'   => +{ class_type => 'Data::OpenSocial::Smoker', },
    'OpenSocial.Url'      => +{ class_type => 'Data::OpenSocial::Url', },
);

sub is_primitive_type {
    my ( $class, $type ) = @_;
    exists $PREMITIVE_TYPES{$type};
}

sub is_imported_type {
    my ( $class, $type ) = @_;
    exists $IMPORTED_TYPES{$type};
}

sub is_simple_type {
    my ( $class, $type ) = @_;
    exists $SIMPLE_TYPES{$type};
}

sub is_complex_type {
    my ( $class, $type ) = @_;
    exists $COMPLEX_TYPES{$type};
}

{
    while ( my ( $type, $enums ) = each %SIMPLE_TYPES ) {
        enum $type => @$enums;
    }
};

{
    while ( my ( $type, $attrs ) = each %COMPLEX_TYPES ) {
        class_type $attrs->{class_type};
        subtype $type => as $attrs->{class_type};
        if ( exists $attrs->{coerce} ) {
            coerce $type => @{ $attrs->{coerce} };
        }
    }
};

no Any::Moose;

1;

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
