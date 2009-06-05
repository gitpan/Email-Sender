package Email::Sender::Transport::Print;
our $VERSION = '0.091560_001';

use Moose;
with 'Email::Sender::Transport';
# ABSTRACT: print email to a filehandle (like stdout)

use IO::Handle;

has 'fh' => (
  is       => 'ro',
  isa      => 'IO::Handle',
  required => 1,
  default  => sub { IO::Handle->new_from_fd(fileno(STDOUT), 'w') },
);

sub send_email {
  my ($self, $email, $env) = @_;

  my $fh = $self->fh;

  $fh->printf("ENVELOPE TO  : %s\n", join(q{, }, @{ $env->{to} }) || '-');
  $fh->printf("ENVELOPE FROM: %s\n", defined $env->{from} ? $env->{from} : '-');
  $fh->print(q{-} x 10 . " begin message\n");

  $fh->print( $email->as_string );

  $fh->print(q{-} x 10 . " end message\n");

  return $self->success;
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;

__END__

=pod

=head1 NAME

Email::Sender::Transport::Print - print email to a filehandle (like stdout)

=head1 VERSION

version 0.091560_001

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


