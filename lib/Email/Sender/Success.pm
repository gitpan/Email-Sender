package Email::Sender::Success;
{
  $Email::Sender::Success::VERSION = '1.300008'; # TRIAL
}
use Moo;
# ABSTRACT: the result of successfully sending mail


no Moo;
1;

__END__

=pod

=head1 NAME

Email::Sender::Success - the result of successfully sending mail

=head1 VERSION

version 1.300008

=head1 DESCRIPTION

An Email::Sender::Success object is just an indicator that an email message was
successfully sent.  Unless extended, it has no properties of its own.

=head1 AUTHOR

Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
