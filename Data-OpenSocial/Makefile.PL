use inc::Module::Install;
name 'Data-OpenSocial';
all_from 'lib/Data/OpenSocial.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
