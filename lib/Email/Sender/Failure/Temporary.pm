package Email::Sender::Failure::Temporary;
our $VERSION = '0.091640_004';

use Moose;
extends 'Email::Sender::Failure';
# ABSTRACT: a temporary delivery failure

__PACKAGE__->meta->make_immutable;
no Moose;
1;

__END__

=pod

=head1 NAME

Email::Sender::Failure::Temporary - a temporary delivery failure

=head1 VERSION

version 0.091640_004

=head1 AUTHOR

  Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut 


