package Email::Sender::Failure::Temporary;
{
  $Email::Sender::Failure::Temporary::VERSION = '1.300001'; # TRIAL
}
use Moo;
extends 'Email::Sender::Failure';
# ABSTRACT: a temporary delivery failure

no Moo;
1;

__END__

=pod

=head1 NAME

Email::Sender::Failure::Temporary - a temporary delivery failure

=head1 VERSION

version 1.300001

=head1 AUTHOR

Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
