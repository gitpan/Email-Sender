package Email::Sender::Transport;
{
  $Email::Sender::Transport::VERSION = '1.300010';
}
use Moo::Role;
# ABSTRACT: a role for email transports

























with 'Email::Sender::Role::CommonSending';

sub is_simple {
  my ($self) = @_;
  return if $self->allow_partial_success;
  return 1;
}

sub allow_partial_success { 0 }

no Moo::Role;
1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Email::Sender::Transport - a role for email transports

=head1 VERSION

version 1.300010

=head1 DESCRIPTION

Email::Sender::Transport is a Moo role to aid in writing classes used to send
mail.  For the most part, its behavior comes entirely from the role
L<Email::Sender::Role::CommonSending>, which it includes. The important
difference is that Transports are often intended to be used by
L<Email::Sender::Simple>, and they provide two methods related to that purpose.

=for Pod::Coverage is_simple allow_partial_success

First, they provide an C<allow_partial_success> method which returns true or
false to indicate whether the transport will ever signal partial success.

Second, they provide an C<is_simple> method, which returns true if the
transport is suitable for use with Email::Sender::Simple.  By default, this
method returns the inverse of C<allow_partial_success>.

It is B<imperative> that these methods be accurate to prevent
Email::Sender::Simple users from sending partially successful transmissions.
Partial success is a complex case that almost all users will wish to avoid at
all times.

=head1 AUTHOR

Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
