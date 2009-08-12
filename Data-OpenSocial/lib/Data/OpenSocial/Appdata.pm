package Data::OpenSocial::Appdata;

use Any::Moose;

has 'entry' => (
    is	      => 'rw',
    isa	      => 'ArrayRef[Any]', ### TODO
    required  => 0,
    predicate => 'has_entry',
);

no Any::Moose;

__PACKAGE__->meta->make_immutable;


