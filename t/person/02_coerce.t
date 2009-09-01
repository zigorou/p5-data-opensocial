use strict;
use Test::More;
use Data::OpenSocial::Person;

plan tests => 5 * 2;

{
    package Test::Data::OpenSocial::Person::IsaType;

    use Any::Moose;
    use Data::OpenSocial::Types qw(OpenSocial.Person);

    has 'data' => (
        is     => 'rw',
        isa    => 'OpenSocial.Person',
        coerce => 1,
    );

    no Any::Moose;

    __PACKAGE__->meta->make_immutable;
}

our %defaults = (
    id           => 'example.org:34KJDCSKJN2HHF0DW20394',
    display_name => "Janey",
    name         => +{ formatted => 'Jane Doe' },
    gender       => 'female',
);

{
    my $type_class = Test::Data::OpenSocial::Person::IsaType->new( data => \%defaults );

    my $data = $type_class->data;

    isa_ok($data, 'Data::OpenSocial::Person');

    is($data->id, $defaults{id}, 'id');
    is($data->display_name, $defaults{display_name}, 'display_name');
    is($data->name->formatted, $defaults{name}{formatted}, 'name');
    is($data->gender, $defaults{gender}, 'gender');
}

{
    my $type_class = Test::Data::OpenSocial::Person::IsaType->new();
    $type_class->data(\%defaults);

    my $data = $type_class->data;
    
    isa_ok($data, 'Data::OpenSocial::Person');

    is($data->id, $defaults{id}, 'id');
    is($data->display_name, $defaults{display_name}, 'display_name');
    is($data->name->formatted, $defaults{name}{formatted}, 'name');
    is($data->gender, $defaults{gender}, 'gender');
}
