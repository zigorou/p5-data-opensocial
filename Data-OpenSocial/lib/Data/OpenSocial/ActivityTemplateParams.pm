package Data::OpenSocial::ActivityTemplateParams;

use Any::Moose;

with 'Data::OpenSocial::Role::AsObject';

use Data::OpenSocial::Types qw(Person);

do {
    my @element_fields = (
        +{
            field     => 'person_key',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_additional_name',
        },
        +{
            field     => 'person_key_display_name',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_family_name',
        },
        +{
            field     => 'person_key_id',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_given_name',
        },
        +{
            field     => 'person',
            is        => 'rw',
            isa       => 'Person',
            required  => 0,
            predicate => 'has_person',
        },
    );

    
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

