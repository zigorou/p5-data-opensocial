package Data::OpenSocial::ActivityTemplateParams;

use Any::Moose;

use Data::OpenSocial::Types qw(OpenSocial.Person);

extends 'Data::OpenSocial::Base';
with 'Data::OpenSocial::Role::AsObject';

do {
    my @element_fields = (
        +{
            field     => 'person_key',
            typemap   => 'PersonKey',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'person_key_display_name',
            typemap   => 'PersonKey.DisplayName',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'person_key_id',
            typemap   => 'PersonKey.Id',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'person_key_profile_url',
            typemap   => 'PersonKey.ProfileUrl',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
        },
        +{
            field     => 'person',
            is        => 'rw',
            isa       => 'OpenSocial.Person',
            required  => 0,
            predicate => 'has_person',
            coerce    => 1,
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while (my ($field, $attr) = each %attrs) {
        has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

