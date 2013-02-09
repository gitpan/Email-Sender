package Email::Sender::Role::HasMessage;
{
  $Email::Sender::Role::HasMessage::VERSION = '1.300004';
}
use Moo::Role;
# ABSTRACT: an object that has a message


has message => (
  is       => 'ro',
  required => 1,
);

no Moo::Role;
1;

__END__

=pod

=head1 NAME

Email::Sender::Role::HasMessage - an object that has a message

=head1 VERSION

version 1.300004

=head1 ATTRIBUTES

=head2 message

This attribute is a message associated with the object.

=head1 AUTHOR

Ricardo Signes <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Ricardo Signes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
