package Data::OpenSocial::Base;

use Any::Moose;
use Any::Moose 'X::AttributeHelpers';

extends any_moose() . '::Object', 'Class::Data::Inheritable';

for (
    qw/element_fields element_to_field_map field_to_element_map
    namespaces field_to_namespace_map/
  )
{
    __PACKAGE__->mk_classdata($_);
}

__PACKAGE__->element_fields([]);
__PACKAGE__->element_to_field_map(+{});
__PACKAGE__->field_to_element_map(+{});
__PACKAGE__->namespaces(
    +{
        'http://ns.opensocial.org/2008/opensocial' => 'os',
        'http://opensocial.org/2008/opensocialapi' => 'osapi',
        'http://www.w3.org/2005/Atom'              => 'atom',
        'http://a9.com/-/spec/opensearch/1.1'      => 'osearch',
    },
);
__PACKAGE__->field_to_namespace_map(+{});

has 'query_fields' => (
    metaclass => 'Collection::Hash',
    is  => 'rw',
    isa => 'HashRef',
    default => sub { +{} },
    provides => +{
        exists => 'exists_in_query_fields'
    }
);

around 'BUILDARGS' => sub {
    my $orig = shift;
    my $class = shift;

    my $args = ( @_ == 1 && ref $_[0] ) ? +{ %{$_[0]} } : +{ @_ };
    $args->{query_fields} ||= +{};
    
    for my $key (keys %$args) {
        next if ($key eq 'query_fields');
        my $field = $class->element_to_field_map->{$key} || $key;
        next unless ($class->can($field));
        $args->{query_fields}{$field} = 1;
        unless (defined $args->{$key}) {
            delete $args->{$key};
            next;
        }
        $args->{$field} = delete $args->{$key} if ($key ne $field);
    }

    $class->$orig($args);
};

sub setup {
    my ( $class, @element_fields ) = @_;

    for (@element_fields) {
        $_->{element} ||= lcfirst join('' => map { ucfirst } split(/_/, $_->{field}) );
    }
    
    $class->element_fields( [ ( @{$class->element_fields}, map { $_->{field} } @element_fields ) ] );
    $class->element_to_field_map(
        +{
            %{$class->element_to_field_map},
            (
                map  { @$_{qw/element field/} }
                grep { exists $_->{element} } @element_fields
            ),
        }
    );
    $class->field_to_element_map(
        +{
            %{$class->field_to_element_map},
            (
                map  { @$_{qw/field element/} }
                grep { exists $_->{element} } @element_fields
            ),
        }
    );
    $class->field_to_namespace_map(
        +{
            %{ $class->field_to_namespace_map },
            (
                map { ( $_->{field}, $_->{namespace} ) }
                @element_fields
            )
        },
    );

    return map {
        my $attr = $_;
        delete $attr->{element};
        delete $attr->{namespace};
        my $field = $attr->{field};
        delete $attr->{field};
        $attr->{predicate} = 'has_' . $field;
        ( $field, $attr );
    } @element_fields;
}

sub element_to_field {
    my ( $proto, $element ) = @_;
    exists $proto->element_to_field_map->{$element}
      ? $proto->element_to_field_map->{$element}
      : '';
}

sub field_to_element {
    my ( $proto, $field ) = @_;
    exists $proto->field_to_element_map->{$field}
      ? $proto->field_to_element_map->{$field}
      : '';
}

no Any::Moose;

__PACKAGE__->meta->make_immutable;
