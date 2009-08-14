package Data::OpenSocial::Account;

use Any::Moose;

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
            typepmap  => 'username',
            is        => 'rw',
            isa       => 'Str',
            required  => 0,
            predicate => 'has_username',
        },
    );

    my %element_to_field =
      map  { @$_{qw/typemap field/} }
      grep { exists $_->{typemap} } @element_fields;
    my %field_to_element =
      map  { @$_{qw/field typemap/} }
      grep { exists $_->{typemap} } @element_fields;
    my @elements = map { $_->{field} } @element_fields;

    sub element_fields {
        return @elements;
    }

    sub element_to_field {
        my ( $proto, $element ) = @_;
        exists $element_to_field{$element}
          ? $element_to_field{$element}
          : $element;
    }

    sub field_to_element {
        my ( $proto, $field ) = @_;
        exists $field_to_element{$field} ? $field_to_element{$field} : $field;
    }

    for (@element_fields) {
        my $field = delete $_->{field};
        delete $_->{typemap};
        has $field => %$_;
    }
};

no Any::Moose;

__PACKAGE__->meta->make_immutable;

