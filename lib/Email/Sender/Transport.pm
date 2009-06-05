package Email::Sender::Transport;
our $VERSION = '0.091560_001';

use Moose::Role;
# ABSTRACT: a role for email transports

with 'Email::Sender::Role::CommonSending';

sub is_simple {
  my ($self) = @_;
  return if $self->allow_partial_success;
  return 1;
}


sub allow_partial_success { 0 }

no Moose::Role;
1;

__END__

=pod

=head1 NAME

Email::Sender::Transport - a role for email transports

=head1 VERSION

version 0.091560_001

=head1 METHODS

=head2 allow_partial_success

If true, the transport may signal partial success by returning an
L<Email::Sender::Success::Partial> object.  For most transports, this is always
false.

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


