#!/usr/bin/env perl
use inc::Module::Install 1.01;

name 'Plack-Middleware-Debug-GitStatus';

all_from 'lib/Plack/Middleware/Debug/GitStatus.pm';

repository 'http://github.com/mannih/Plack-Middleware-Debug-GitStatus.git';

requires 'Plack';
test_requires 'Test::Most';
test_requires 'Test::MockModule';

auto_install;
WriteAll;

