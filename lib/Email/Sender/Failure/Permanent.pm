package Email::Sender::Failure::Permanent;
our $VERSION = '0.092840';


use Moose;
extends 'Email::Sender::Failure';
# ABSTRACT: a permanent delivery failure

__PACKAGE__->meta->make_immutable;
no Moose;
1;

__END__

=pod

=head1 NAME

Email::Sender::Failure::Permanent - a permanent delivery failure

=head1 VERSION

version 0.092840

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut 


