use strict;
use Test::More;
use Data::OpenSocial::AppdataEntry;

plan tests => 3 * 2;

{

    package Test::Data::OpenSocial::AppdataEntry::IsaType;

    use Any::Moose;
    use Data::OpenSocial::Types qw(OpenSocial.AppdataEntry);

    has 'appdata_entry' => (
        is     => 'rw',
        isa    => 'OpenSocial.AppdataEntry',
        coerce => 1,
    );

    no Any::Moose;

    __PACKAGE__->meta->make_immutable;
}

{

    # from 'HashRef'
    my $type_class =
      Test::Data::OpenSocial::AppdataEntry::IsaType->new(
        appdata_entry => +{ pokes => 3 } );

    my $data = $type_class->appdata_entry;

    isa_ok( $data, 'Data::OpenSocial::AppdataEntry' );
    is( $data->key,   'pokes' );
    is( $data->value, 3 );
}

{

    # from 'HashRef'
    my $type_class = Test::Data::OpenSocial::AppdataEntry::IsaType->new(
        appdata_entry => +{
            key   => 'pokes',
            value => 3,
        }
    );

    my $data = $type_class->appdata_entry;

    isa_ok( $data, 'Data::OpenSocial::AppdataEntry' );
    is( $data->key,   'pokes' );
    is( $data->value, 3 );
}

