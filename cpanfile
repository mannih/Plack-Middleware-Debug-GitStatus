requires 'Plack';

on build => sub {
    requires 'ExtUtils::MakeMaker', '6.36';
    requires 'Test::MockModule';
    requires 'Test::Most';
};
