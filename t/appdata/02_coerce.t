use strict;
use Test::More;
use Data::OpenSocial::Appdata;

plan tests => 5 * 2;

{
    package Test::Data::OpenSocial::Appdata::IsaType;

    use Any::Moose;
    use Data::OpenSocial::Types qw(OpenSocial.Appdata);

    has 'data' => (
        is     => 'rw',
        isa    => 'OpenSocial.Appdata',
        coerce => 1,
    );

    no Any::Moose;

    __PACKAGE__->meta->make_immutable;
}

{
    # from 'HashRef'
    # provide entry as Hash, ordering sorted by key.
    my $type_class =
      Test::Data::OpenSocial::Appdata::IsaType->new( data =>
          +{ entry => +{ pokes => 3, last_poke => '2008-02-13T18:30:02Z', } } );

    my $data = $type_class->data;

    isa_ok( $data, 'Data::OpenSocial::Appdata' );
    is( $data->entry->[0]->key,   'last_poke' );
    is( $data->entry->[0]->value, '2008-02-13T18:30:02Z' );
    is( $data->entry->[1]->key,   'pokes' );
    is( $data->entry->[1]->value, 3 );
}

{
    # from 'ArrayRef[HashRef]'
    my $type_class =
      Test::Data::OpenSocial::Appdata::IsaType->new(
        data => +{ entry => [ +{ pokes => 3, }, +{ last_poke => '2008-02-13T18:30:02Z', }, ] } );

    my $data = $type_class->data;

    isa_ok( $data, 'Data::OpenSocial::Appdata' );
    is( $data->entry->[0]->key,   'pokes' );
    is( $data->entry->[0]->value, 3 );
    is( $data->entry->[1]->key,   'last_poke' );
    is( $data->entry->[1]->value, '2008-02-13T18:30:02Z' );
}

