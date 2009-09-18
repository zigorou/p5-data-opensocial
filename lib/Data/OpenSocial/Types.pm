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
            'OpenSocial.MessageType',
            'OpenSocial.EnvironmentType',
            'OpenSocial.LookingForType',
            'OpenSocial.NetworkPresenceType',
            ### subtype
            'OpenSocial.Account',
            'OpenSocial.Activity',
            'OpenSocial.ActivityTemplateParams',
            'OpenSocial.Address',
            'OpenSocial.Album',
            'OpenSocial.Appdata',
            'OpenSocial.AppdataEntry',
            'OpenSocial.BodyType',
            'OpenSocial.CreateActivityPriority',
            'OpenSocial.Drinker',
            'OpenSocial.Entry',
            'OpenSocial.Environment',
            'OpenSocial.EscapeType',
            'OpenSocial.Group',
            'OpenSocial.LookingFor',
            'OpenSocial.MediaItem',
            'OpenSocial.Message',
            'OpenSocial.Name',
            'OpenSocial.NetworkPresence',
            'OpenSocial.Organization',
            'OpenSocial.Person',
            'OpenSocial.PluralPersonField',
            'OpenSocial.Presence',
            'OpenSocial.Response',
            'OpenSocial.Smoker',
            'OpenSocial.Types',
            'OpenSocial.Url',
            ### collection
            'OpenSocial.Address.Collection',
            'OpenSocial.AppdataEntry.Collection',
            'OpenSocial.Entry.Collection',
            'OpenSocial.MediaItem.Collection',
            'OpenSocial.Url.Collection',
        ]
    ],
    'X::Types::'
      . any_moose() => [qw/HashRef ArrayRef CodeRef Object Str Bool/],
);
use Any::Moose '::Util::TypeConstraints';
use Any::Moose 'X::Types::DateTime';

use DateTime::Format::ISO8601;
use Module::Load;
use Module::Loaded;

our %PREMITIVE_TYPES = (
    Str             => 1,
    Bool            => 1,
    Int             => 1,
    'ArrayRef[Str]' => 1,
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
    'OpenSocial.MessageType' =>
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
        coerce     => [
            from 'HashRef',
            via {
                Data::OpenSocial::Types->create_data( 'Account', $_ );
            }
        ],
    },
    'OpenSocial.Activity' => +{
        class_type => 'Data::OpenSocial::Activity',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'Activity', $_ ); }
        ],
    },
    'OpenSocial.ActivityTemplateParams' => +{
        class_type => 'Data::OpenSocial::ActivityTemplateParams',
        coerce     => [
            from 'HashRef',
            via {
                Data::OpenSocial::Types->create_data( 'ActivityTemplateParams',
                    $_ );
            }
        ],
    },
    'OpenSocial.Address' => +{
        class_type => 'Data::OpenSocial::Address',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'Address', $_ ); }
        ],
    },
    'OpenSocial.Album' => +{
        class_type => 'Data::OpenSocial::Album',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'Album', $_ ); }
        ],
    },
    'OpenSocial.Appdata' => +{
        class_type => 'Data::OpenSocial::Appdata',
        coerce     => [
            from 'HashRef' => via {
                my $args = shift;

                if ( exists $args->{entry} && keys %$args == 1 ) {
                    return Data::OpenSocial::Types->create_data( 'Appdata',
                        $args );
                }
                else {
                    return Data::OpenSocial::Types->create_data( 'Appdata',
                        +{ entry => $args } );
                }
            },
        ]
    },
    'OpenSocial.AppdataEntry' => +{
        class_type => 'Data::OpenSocial::AppdataEntry',
        coerce     => [
            from 'HashRef' => via {
                my $hash = shift;

                if ( exists $hash->{key} && exists $hash->{value} ) {
                    return Data::OpenSocial::Types->create_data( 'AppdataEntry',
                        $hash );
                }
                else {
                    my %args;
                    @args{qw/key value/} = %$hash;
                    return Data::OpenSocial::Types->create_data( 'AppdataEntry',
                        \%args );
                }
            },
        ]
    },
    'OpenSocial.BodyType' => +{
        class_type => 'Data::OpenSocial::BodyType',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'BodyType', $_ ); }
        ]
    },
    'OpenSocial.Drinker' => +{
        class_type => 'Data::OpenSocial::Drinker',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'Drinker', $_ ); }
        ]
    },
    'OpenSocial.Entry' => +{
        class_type => 'Data::OpenSocial::Entry',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'Entry', $_ ); },
        ],
    },
    'OpenSocial.Group' => +{
        class_type => 'Data::OpenSocial::Group',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'Group', $_ ); }
        ]
    },
    'OpenSocial.MediaItem' => +{
        class_type => 'Data::OpenSocial::MediaItem',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'MediaItem', $_ ); }
        ]
    },
    'OpenSocial.Message' => +{
        class_type => 'Data::OpenSocial::Message',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'Message', $_ ); }
        ]
    },
    'OpenSocial.Name' => +{
        class_type => 'Data::OpenSocial::Name',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'Name', $_ ); }
        ]
    },
    'OpenSocial.NetworkPresence' => +{
        class_type => 'Data::OpenSocial::NetworkPresence',
        coerce     => [
            from 'HashRef',
            via {
                Data::OpenSocial::Types->create_data( 'NetworkPresence', $_ );
            }
        ]
    },
    'OpenSocial.Organization' => +{
        class_type => 'Data::OpenSocial::Organization',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'Organization', $_ ); }
        ]
    },
    'OpenSocial.Person' => +{
        class_type => 'Data::OpenSocial::Person',
        coerce     => [
            from 'HashRef',
            via {
                Data::OpenSocial::Types->create_data( 'Person', $_ );
            },
        ]
    },
    'OpenSocial.PluralPersonField' => +{
        class_type => 'Data::OpenSocial::PluralPersonField',
        coerce     => [
            from 'HashRef',
            via {
                Data::OpenSocial::Types->create_data( 'PluralPersonField', $_ );
            }
        ],
    },
    'OpenSocial.Presence' => +{
        class_type => 'Data::OpenSocial::Presence',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'Presence', $_ ); }
        ],
    },
    'OpenSocial.Response' => +{
        class_type => 'Data::OpenSocial::Response',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_date( 'Response', $_ ); },
        ],
    },
    'OpenSocial.Smoker' => +{
        class_type => 'Data::OpenSocial::Smoker',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'Smoker', $_ ); }
        ],
    },
    'OpenSocial.Url' => +{
        class_type => 'Data::OpenSocial::Url',
        coerce     => [
            from 'HashRef',
            via { Data::OpenSocial::Types->create_data( 'Url', $_ ); }
        ],
    },
);

our %COLLECTION_TYPES = (
    'OpenSocial.Address.Collection' => +{
        item_class => 'Data::OpenSocial::Address',
        as         => 'ArrayRef[OpenSocial.Address]',
        coerce     => [
            from 'ArrayRef[HashRef]',
            via {
                return [
                    map {
                        Data::OpenSocial::Types->create_data( 'Address', $_ )
                      } @$_
                ];
            },
        ],
    },
    'OpenSocial.AppdataEntry.Collection' => +{
        item_class => 'Data::OpenSocial::AppdataEntry',
        as         => 'ArrayRef[OpenSocial.AppdataEntry]',
        coerce     => [
            from 'ArrayRef[HashRef]',
            via {
                if ( exists $_->[0]->{key} && exists $_->[0]->{value} ) {
                    return [
                        map {
                            Data::OpenSocial::Types->create_data(
                                'AppdataEntry', $_ )
                          } @$_
                    ];
                }
                else {
                    return [
                        map {
                            Data::OpenSocial::Types->create_data(
                                'AppdataEntry',
                                +{
                                    key   => $_->[0],
                                    value => $_->[1],
                                }
                              )
                          }
                          map { [%$_]; } @$_,
                    ];
                }
            },
            from 'HashRef',
            via {
                my $hash = shift;
                return [
                    map {
                        Data::OpenSocial::Types->create_data(
                            'AppdataEntry',
                            +{
                                key   => $_,
                                value => $hash->{$_},
                            },
                          )
                      }
                      sort keys %$hash,
                ];
            }
        ],
    },
    'OpenSocial.Entry.Collection' => +{
        item_class => 'Data::OpenSocial::Entry',
        as         => 'ArrayRef[OpenSocial.Entry]',
        coerce     => [
            from 'ArrayRef[HashRef]',
            via {
                return [
                    map { Data::OpenSocial::Types->create_data( 'Entry', $_ ) }
                      @$_ ];
            },
        ],
    },
    'OpenSocial.MediaItem.Collection' => +{
        item_class => 'Data::OpenSocial::MediaItem',
        as         => 'ArrayRef[OpenSocial.MediaItem]',
        coerce     => [
            from 'ArrayRef[HashRef]',
            via {
                return [
                    map {
                        Data::OpenSocial::Types->create_data( 'MediaItem', $_ )
                      } @$_
                ];
            }
        ],
    },
    'OpenSocial.Url.Collection' => +{
        item_class => 'Data::OpenSocial::Url',
        as         => 'ArrayRef[OpenSocial.Url]',
        coerce     => [
            from 'ArrayRef[HashRef]',
            via {
                return [
                    map { Data::OpenSocial::Types->create_data( 'Url', $_ ) }
                      @$_ ];
            }
        ],
    }
);

sub create_data {
    my ( $class, $class_type, $args ) = @_;

    if ( substr( $class_type, 0, 1 ) eq '+' ) {
        $class_type = substr( $class_type, 1 );
    }
    else {
        $class_type = 'Data::OpenSocial::' . $class_type;
    }

    load $class_type unless ( is_loaded($class_type) );
    $class_type->new($args);
}

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
        }
    }
};

do {
    if ( any_moose() eq 'Moose' ) {
        coerce 'DateTime' => from 'Str' => via {
            DateTime::Format::ISO8601->parse_datetime($_);
        }
    }

    while ( my ( $type, $attrs ) = each %COLLECTION_TYPES ) {
        subtype $type => as $attrs->{as};
        coerce $type  => @{ $attrs->{coerce} };
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
