requires 'Plack';
requires 'Plack::Middleware::Debug';

on build => sub {
    requires 'ExtUtils::MakeMaker', '6.36';
    requires 'Test::MockModule';
    requires 'Test::Most';
};
