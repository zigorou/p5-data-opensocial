use inc::Module::Install;
name 'Data-OpenSocial';
all_from 'lib/Data/OpenSocial.pm';

requires 'Any::Moose';
requires 'Class::Data::Inheritable';
requires 'Data::Util';
requires 'DateTime';
requires 'DateTime::Format::ISO8601';
requires 'JSON::Any';
requires 'Module::Load';
requires 'Module::Loaded';
requires 'Moose';
requires 'Moose::Util::TypeConstraints';
requires 'MooseX::AttributeHelpers';
requires 'MooseX::Types';
requires 'MooseX::Types::DateTime';
requires 'MooseX::Types::Moose';
requires 'Mouse';
requires 'Mouse::Util::TypeConstraints';
requires 'MouseX::AttributeHelpers';
requires 'MouseX::Types';
requires 'MouseX::Types::DateTime';
requires 'MouseX::Types::Mouse';

tests 't/*.t t/*/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;

auto_include;
WriteAll;
