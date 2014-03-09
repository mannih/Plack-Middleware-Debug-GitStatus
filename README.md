# NAME

Plack::Middleware::Debug::GitStatus - Display git status information about the directory from which you run your development server

# SYNOPSIS

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

# DESCRIPTION

This panel gives you quick access to the most relevant git information:

- the currently checked out branch
- git status information
- information about the most recent commit

# BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
[https://github.com/mannih/Plack-Middleware-Debug-GitStatus](https://github.com/mannih/Plack-Middleware-Debug-GitStatus).

# AUTHOR

Manni Heumann, `<cpan@lxxi.org>`

# COPYRIGHT AND LICENSE

Copyright 2014 by Manni Heumann

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
