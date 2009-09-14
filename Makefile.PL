use inc::Module::Install;
name 'Data-OpenSocial';
all_from 'lib/Data/OpenSocial.pm';

requires 'Any::Moose';
requires 'Data::Util';
requires 'DateTime::Format::ISO8601';
requires 'JSON::Any';
requires 'Module::Load';
requires 'Module::Loaded';

requires 'Types::MooseX';
requires 'MouseX::Types';

tests 't/*.t t/*/*.t';
author_tests 'xt';

build_requires 'DateTime';
build_requires 'ExtUtils::MakeMaker';
build_requires 'Filter::Util::Call';
build_requires 'Test::More';

use_test_base;
auto_include;
WriteAll;
