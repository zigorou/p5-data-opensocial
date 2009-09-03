package Data::OpenSocial::Base;

use Any::Moose;

extends 'Moose::Object', 'Class::Data::Inheritable';

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
