package Email::Sender::Role::CommonSending;
our $VERSION = '0.091560_001';

use Moose::Role;
# ABSTRACT: the common sending tasks most Email::Sender classes will need

use Carp;
use Email::Abstract;
use Email::Sender::Success;
use Email::Sender::Failure::Temporary;
use Email::Sender::Failure::Permanent;
use Scalar::Util ();

with 'Email::Sender';

requires 'send_email';

sub send {
  my ($self, $message, $env, @rest) = @_;
  my $email    = $self->prepare_email($message);
  my $envelope = $self->prepare_envelope($env);

  my $return = eval {
    $self->send_email($email, $envelope, @rest);
  };

  my $err = $@;
  return $return if $return;

  if (eval { $err->isa('Email::Sender::Failure') } and ! $err->recipients) {
    $err->_recipients([ @{ $envelope->{to} } ]);
  }

  defined($err) ? die($err) : confess('unknown error');
}


sub prepare_email {
  my ($self, $msg) = @_;

  confess("no email passed in to sender") unless defined $msg;

  # We check blessed because if someone would pass in a large message, in some
  # perls calling isa on the string would create a package with the string as
  # the name.  If the message was (say) two megs, now you'd have a two meg hash
  # key in the stash.  Oops! -- rjbs, 2008-12-04
  return $msg if blessed $msg and eval { $msg->isa('Email::Abstract') };

  return Email::Abstract->new($msg);
}


sub prepare_envelope {
  my ($self, $env) = @_;

  my %new_env;
  $new_env{to}   = ref $env->{to} ? $env->{to} : [ grep {defined} $env->{to} ];
  $new_env{from} = $env->{from};

  return \%new_env;
}


sub success {
  my $self = shift;
  my $success = Email::Sender::Success->new(@_);
}

no Moose::Role;
1;

__END__

=pod

=head1 NAME

Email::Sender::Role::CommonSending - the common sending tasks most Email::Sender classes will need

=head1 VERSION

version 0.091560_001

=head1 METHODS

=head2 prepare_email

This method is passed a scalar and is expected to return an Email::Abstract
object.  You probably shouldn't override it in most cases.

=head2 prepare_envelope

This method is passed a hashref and returns a new hashref that should be used
as the envelope passed to the C<send_email> method.  This method is responsible
for ensuring that the F<to> entry is an array.

=head2 success

  ...
  return $self->success;

This method returns a new Email::Sender::Success object.  Arguments passed to
this method are passed along to the Success's constructor.  This is provided as
a convenience for returning success from subclasses' C<send_email> methods.

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


