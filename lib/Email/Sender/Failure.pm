package Email::Sender::Failure;
our $VERSION = '0.091740';

use Moose;
# ABSTRACT: a report of failure from an email sending transport

use overload '""' => sub { $_[0]->message }, fallback => 1;


has message => (
  is       => 'ro',
  required => 1,
);


has code => (
  is => 'ro',
);


has _recipients => (
  is         => 'rw',
  isa        => 'ArrayRef',
  auto_deref => 1,
  init_arg   => 'recipients',
);

sub recipients { shift->_recipients }


sub throw {
  my $inv = shift;
  die $inv if ref $inv;
  die $inv->new(@_);
}

sub BUILD {
  my ($self) = @_;
  confess("message must contain non-space characters")
    unless $self->message =~ /\S/;
}

sub BUILDARGS {
  my ($self, @args) = @_;

  return {} unless @args;
  return {} if @args == 1 and ! defined $args[0];

  if (@args == 1 and (!ref $args[0]) and defined $args[0] and length $args[0]) {
    return { message => $args[0] };
  }

  return $self->SUPER::BUILDARGS(@args);
}


__PACKAGE__->meta->make_immutable;
no Moose;
1;

__END__

=pod

=head1 NAME

Email::Sender::Failure - a report of failure from an email sending transport

=head1 VERSION

version 0.091740

=head1 SEE ALSO

=over 

=item * L<Email::Sender::Permanent>

=item * L<Email::Sender::Temporary>

=item * L<Email::Sender::Multi>

=back 

=head1 ATTRIBUTES

=head2 message

This method returns the failure message, which should describe the failure.
Failures stringify to this message.

=head2 code

This returns the numeric code of the failure, if any.  This is mostly useful
for network protocol transports like SMTP.  This may be undefined.

=head2 recipients

This returns a list (or, in scalar context, an arrayref) of addresses to which
the email could not be sent.

=head1 METHODS

=head2 throw

This method can be used to instantiate and throw an Email::Sender::Failure
object at once.

  Email::Sender::Failure->throw(\%arg);

Instead of a hashref of args, you can pass a single string argument which will
be used as the C<message> of the new failure.

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


