package Email::Sender::Transport::DevNull;
our $VERSION = '0.091560_001';

use Moose;
with 'Email::Sender::Transport';
# ABSTRACT: happily throw away your mail

sub send_email { return $_[0]->success }

__PACKAGE__->meta->make_immutable;
no Moose;
1;

__END__

=pod

=head1 NAME

Email::Sender::Transport::DevNull - happily throw away your mail

=head1 VERSION

version 0.091560_001

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


