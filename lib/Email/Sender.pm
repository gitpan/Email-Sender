package Email::Sender;
our $VERSION = '0.091560_001';

use Moose::Role;
# ABSTRACT: a library for sending email

requires 'send';


no Moose::Role;
1;

__END__

=pod

=head1 NAME

Email::Sender - a library for sending email

=head1 VERSION

version 0.091560_001

=head1 DESCRIPTION

Email::Sender replaces the old and sometimes problematic Email::Send library,
which did a decent job at handling very simple email sending tasks, but was not
suitable for serious use, for a variety of reasons.

At present, the casual user is probably best off using
L<Email::Sender::Transport::Sendmail>.  If a local F<sendmail> program is
unavailable, L<Email::Sender::Transport::SMTP> will allow you to send mail
through your relay host.

In the future, L<Email::Sender::Simple> will provide a very simple interface
for sending mail.

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


