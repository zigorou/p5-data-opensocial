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
            ### collection
            'OpenSocial.AppdataEntry.Collection',
        ]
    ],
    'X::Types::'
      . any_moose() => [qw/HashRef ArrayRef CodeRef Object Str Bool/],
);
use Any::Moose '::Util::TypeConstraints';
use Any::Moose 'X::Types::DateTime';

use UNIVERSAL::require;
use DateTime::Format::ISO8601;

use Data::OpenSocial::AppdataEntry;
use Data::OpenSocial::Name;

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
    'OpenSocial.Account' => +{
        class_type => 'Data::OpenSocial::Account',
        coerce =>
          [ from 'HashRef', via { Data::OpenSocial::Account->new(%$_); } ],
    },
    'OpenSocial.Activity' => +{
        class_type => 'Data::OpenSocial::Activity',
        coerce =>
          [ from 'HashRef', via { Data::OpenSocial::Activity->new(%$_); } ],
    },
    'OpenSocial.ActivityTemplateParams' => +{
        class_type => 'Data::OpenSocial::ActivityTemplateParams',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::ActivityTemplateParams->new(%$_); }
        ],
    },
    'OpenSocial.Address' => +{
        class_type => 'Data::OpenSocial::Address',
        coerce =>
          [ from 'HashRef', via { Data::OpenSocial::Address->new(%$_); } ],
    },
    'OpenSocial.Appdata' => +{
        class_type => 'Data::OpenSocial::Appdata',
        coerce     => [
            from 'HashRef' => via {
                Data::OpenSocial::Appdata->new(%$_);
            },
        ]
    },
    'OpenSocial.AppdataEntry' => +{
        class_type => 'Data::OpenSocial::AppdataEntry',
        coerce     => [
            from 'HashRef' => via {
                my $hash = shift;

                if ( exists $hash->{key} && exists $hash->{value} ) {
                    return Data::OpenSocial::AppdataEntry->new(%$hash);
                }
                else {
                    my %args;
                    @args{qw/key value/} = %$hash;
                    return Data::OpenSocial::AppdataEntry->new(%args);
                }
            },
        ]
    },
    'OpenSocial.BodyType' => +{
        class_type => 'Data::OpenSocial::BodyType',
        coerce =>
          [ from 'HashRef', via { Data::OpenSocial::BodyType->new(%$_); } ]
    },
    'OpenSocial.Drinker' => +{
        class_type => 'Data::OpenSocial::Drinker',
        coerce =>
          [ from 'HashRef', via { Data::OpenSocial::Drinker->new(%$_); } ]
    },
    'OpenSocial.Mediaitem' => +{
        class_type => 'Data::OpenSocial::MediaItem',
        coerce =>
          [ from 'HashRef', via { Data::OpenSocial::MediaItem->new(%$_); } ]
    },
    'OpenSocial.Name' => +{
        class_type => 'Data::OpenSocial::Name',
        coerce => [ from 'HashRef', via { Data::OpenSocial::Name->new(%$_); } ]
    },
    'OpenSocial.NetworkPresence' => +{
        class_type => 'Data::OpenSocial::NetworkPresence',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::NetworkPresence->new(%$_); }
        ]
    },
    'OpenSocial.Organization' => +{
        class_type => 'Data::OpenSocial::Organization',
        coerce =>
          [ from 'HashRef', via { Data::OpenSocial::Organization->new(%$_); } ]
    },
    'OpenSocial.Person' => +{
        class_type => 'Data::OpenSocial::Person',
        coerce     => [
            from 'HashRef',
            via {

                # Data::OpenSocial::Person->require;
                Data::OpenSocial::Person->new(%$_);
            },
        ]
    },
    'OpenSocial.PluralPersonField' => +{
        class_type => 'Data::OpenSocial::PluralPersonField',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::PluralPersonField->new(%$_); }
        ],
    },
    'OpenSocial.Presence' => +{
        class_type => 'Data::OpenSocial::Presence',
        coerce =>
          [ from 'HashRef', via { Data::OpenSocial::Presence->new(%$_); } ],
    },
    'OpenSocial.Smoker' => +{
        class_type => 'Data::OpenSocial::Smoker',
        coerce =>
          [ from 'HashRef', via { Data::OpenSocial::Smoker->new(%$_); } ],
    },
    'OpenSocial.Url' => +{
        class_type => 'Data::OpenSocial::Url',
        coerce => [ from 'HashRef', via { Data::OpenSocial::Url->new(%$_); } ],
    },
);

our %COLLECTION_TYPES = (
    'OpenSocial.AppdataEntry.Collection' => +{},
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

sub is_collection_type {
    my ( $class, $type ) = @_;
    exists $COLLECTION_TYPES{$type};
}

do {
    while ( my ( $type, $enums ) = each %SIMPLE_TYPES ) {
        enum $type => @$enums;
    }
};

do {
    while ( my ( $type, $attrs ) = each %COMPLEX_TYPES ) {
        my $class_name = $attrs->{class_type};
        class_type $class_name;
        subtype $type => as $class_name;
        if ( exists $attrs->{coerce} ) {
            coerce $type => @{ $attrs->{coerce} };

            # subtype "ArrayRef[$type]" => as 'ArrayRef[Object]';
            #             coerce "ArrayRef[$type]" => via {
            #                 my $list = @_;
            #                 return [
            #                     map { $class_name->new(%$_) }
            #                     @$list
            #                 ];
            #             };
        }
    }
};

do {
    coerce 'DateTime'
        => from 'Str'
        => via {
        DateTime::Format::ISO8601->parse_datetime($_);
    } if (any_moose() eq 'Moose');

    subtype 'OpenSocial.AppdataEntry.Collection' => as
      'ArrayRef[OpenSocial.AppdataEntry]';
    coerce 'OpenSocial.AppdataEntry.Collection' => from 'ArrayRef[HashRef]' =>
      via {
        if ( exists $_->[0]->{key} && exists $_->[0]->{value} ) {
            return [ map { Data::OpenSocial::AppdataEntry->new(%$_) } @$_, ];
        }
        else {
            return [
                map {
                    Data::OpenSocial::AppdataEntry->new(
                        key   => $_->[0],
                        value => $_->[1]
                      )
                  }
                  map { [%$_]; } @$_,
            ];
        }
      } => from 'HashRef',
      => via {
        my $hash = shift;
        return [
            map {
                Data::OpenSocial::AppdataEntry->new(
                    key   => $_,
                    value => $hash->{$_}
                  )
              }
              sort keys %$hash,
        ];
      };

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
