package MyData::Person;

use Any::Moose;

extends 'Data::OpenSocial::Person';

{
    my @element_fields = (
        +{
            namespace => 'http://ns.example.com/',
            field     => 'blood_type',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            namespace => 'http://ns.example.com/',
            field     => 'job_type',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ( $field, $attr ) = each %attrs ) {
        has $field => %$attr;
    }

    __PACKAGE__->namespaces->{q|http://ns.example.com/|} = 'exam';
}

no Any::Moose;

__PACKAGE__->meta->make_immutable;
