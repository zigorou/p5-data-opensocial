package Data::OpenSocial::PluralPersonField;

use Any::Moose;

with 'Data::OpenSocial::Role::AsObject';

has 'value' => (
    is => 'rw',
    isa => 'Str',
    required => 0,
    predicate => 'has_value',
);

has 'type' => (
    is => 'rw',
    isa => 'Str',
    required => 0,
    predicate => 'has_type',
);

has 'primary' => (
    is => 'rw',
    isa => 'Bool',
    required => 0,
    predicate => 'has_primary',
);

sub elements_map {
    return +{};
}

sub element_fields {
    return qw(value type primary);
}

no Any::Moose;

__PACKAGE__->meta->make_immutable;

__END__

has 'ns_uri' => (
    is => 'ro',
    isa => 'URI',
    default => sub {
        URI->new('http://ns.opensocial.org/2008/opensocial');
    },
    lazy => 1,
);

has 'ns_prefix' => (
    is => 'rw',
    isa => 'Str',
    default => '',
);

has 'element' => (
    is => 'ro',
    isa => 'XML::LibXML::Element',
    default => sub { 
        my $self = shift;
        my $elem = XML::LibXML::Element->new($self->element_name);
        $elem->setNamespace(
            $self->ns_uri,
            $self->ns_prefix,
        );

        $elem;
    },
    lazy => 1,
);

has 'element_name' => (
    is => 'rw',
    isa => 'Str',
    required => 1,
);

has 'child_elements' => (
    is => 'ro',
    isa => 'ArrayRef[Str]',
    default => sub { [qw/value type primary/] },
);

sub as_xml {
    my $self = shift;
    my $element = $self->element;

    no strict 'refs';

    for my $child_element_name (@{$self->child_elements}) {
        my $code = $self->can("has_" . $child_element_name);
        next unless ($code && $code->($self));
        my $child_element = XML::LibXML::Element->new($child_element_name);
        $child_element->appendText($self->$child_element_name);
        $element->appendChild($child_element);
    }

    return $element;
}

sub as_object {
    my $self = shift;

    my $object = +{};

    for my $child_element_name (@{$self->child_elements}) {
        my $code = $self->can("has_" . $child_element_name);
        next unless ($code && $code->($self));
        $object->{$child_element_name} = $self->$child_element_name;
    }

    return $object;
}
