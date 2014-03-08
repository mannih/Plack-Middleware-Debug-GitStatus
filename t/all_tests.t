use Test::Most;
use Test::MockModule;
use Plack::Middleware::Debug::Panel;

BEGIN {
    use_ok( 'Plack::Middleware::Debug::GitStatus' );
}


done_testing;


sub get_object {
    return Plack::Middleware::Debug::GitStatus->new;
}

