package Data::OpenSocial::Base;

use Any::Moose;

extends 'Moose::Object', 'Class::Data::Inheritable';

with any_moose() . 'X::Object::Pluggable';

for (
    qw/element_fields element_to_field_map field_to_element_map
    namespaces field_to_namespace_map/
  )
{
    __PACKAGE__->mk_classdata($_);
}

__PACKAGE__->namespaces(
    +{
        'http://ns.opensocial.org/2008/opensocial' => 'os',
        'http://www.w3.org/2005/Atom'              => 'atom',
        'http://a9.com/-/spec/opensearch/1.1'      => 'osearch',
    },
);

sub setup {
    my ( $class, @element_fields ) = @_;

    $class->element_fields( [ map { $_->{field} } @element_fields ] );
    $class->element_to_field_map(
        +{
            map  { @$_{qw/typemap field/} }
            grep { exists $_->{typemap} } @element_fields
        }
    );
    $class->field_to_element_map(
        +{
            map  { @$_{qw/field typemap/} }
            grep { exists $_->{typemap} } @element_fields
        }
    );
    $class->field_to_namespace_map(
        +{ map { ( $_->{field}, $_->{namespace} ) } @element_fields } );

    return map {
        my $attr = $_;
        delete $attr->{typemap};
        delete $attr->{namespace};
        my $field = $attr->{field};
        delete $attr->{field};
        $attr->{predicate} = 'has_' . $field;
        ( $field, $attr );
    } @element_fields;
}

sub BUILD {
    my ($self, $args) = @_;

    $self->_plugin_ns('Format');
    $self->_plugin_app_ns([ 'Data::OpenSocial',  ]);
}

sub element_to_field {
    my ( $proto, $element ) = @_;
    exists $proto->element_to_field_map->{$element}
      ? $proto->element_to_field_map->{$element}
      : $element;
}

sub field_to_element {
    my ( $proto, $field ) = @_;
    exists $proto->field_to_element_map->{$field}
      ? $proto->field_to_element_map->{$field}
      : $field;
}

no Any::Moose;

__PACKAGE__->meta->make_immutable;
