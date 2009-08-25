package Data::OpenSocial::Account;

use Any::Moose;

extends 'Data::OpenSocial::Base';
with 'Data::OpenSocial::Role::AsObject';

do {
    my @element_fields = (
        +{
            field     => 'domain',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_domain',
        },
        +{
            field     => 'primary',
            is        => 'rw',
            isa       => 'Bool',
            required  => 0,
            predicate => 'has_primary',
        },
        +{
            field     => 'user_id',
            typemap   => 'userid',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_userid',
        },
        +{
            field     => 'user_name',
            typemap  => 'username',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_username',
        },
    );

    my %attrs = __PACKAGE__->setup(@element_fields);
    while ( my ($field, $attr) = each %attrs ) {
	has $field => %$attr;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

