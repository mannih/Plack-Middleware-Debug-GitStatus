package Plack::Middleware::Debug::GitStatus;
use strict;
use warnings;

our $VERSION = '0.01';
$VERSION = eval $VERSION;

use Plack::Util::Accessor qw( git_dir );
use Encode qw/ decode_utf8 /;

use parent 'Plack::Middleware::Debug::Base';

sub run {
    my ( $self, $env, $panel ) = @_;

    return sub {
        $panel->title( 'GitStatus' );
        $panel->nav_title( 'GitStatus' );
        $panel->nav_subtitle( 'git status information' );

        my @info;

        chdir $self->git_dir if $self->git_dir;
        my $current_branch = `git symbolic-ref HEAD 2>&1`;

        if ( $? ) {
            push @info, 'Error', 'Not a git repository ';
        }
        else {
            $current_branch =~ s|refs/heads/||;
            push @info, 'Current branch', $current_branch;

            my $status = `git status -s`;
            $status = 'clean' unless $status;
            push @info, 'Status', $status;

            push @info, 'Last commit:', '';
            my @ci_info = split /\0/, `git log -1 --pretty=format:%H%x00%an%x00%aD%x00%s`;
            push @info, 'SHA-1', shift @ci_info;
            push @info, 'Author', decode_utf8 shift @ci_info;
            push @info, 'Date', shift @ci_info;
            push @info, 'Message', decode_utf8 shift @ci_info;
        }

        $panel->content( $self->render_list_pairs( \@info ) );
    }
}

1;

__END__

=head1 NAME

Plack::Middleware::Debug::GitStatus - Display git status information about the directory from which you run your development server

=head1 SYNOPSIS

 # Assuming your current directory is the relevant git dir:
 builder {
     enable 'Debug', panels => [ qw( Environment Response GitStatus ) ];
     $app;
 };

 # If you need to set a git dir:
 return builder {
     enable 'Debug', panels => [ qw( Environment Response ) ];
     enable 'Debug::GitStatus', git_dir => '/some/path';
     $app;
 };

=head1 DESCRIPTION

This panel gives you quick access to the most relevant git information:

=over

=item the currently checked out branch

=item git status information

=item information about the most recent commit

=back

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<https://github.com/mannih/Plack-Middleware-Debug-GitStatus>.

=head1 AUTHOR

Manni Heumann, C<< <cpan@lxxi.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2014 by Manni Heumann

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

