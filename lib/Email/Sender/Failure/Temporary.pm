package Email::Sender::Failure::Temporary;
use Mouse;
extends 'Email::Sender::Failure';

our $VERSION = '0.001';

=head1 NAME

Email::Sender::Failure::Temporary - a temporary delivery failure

=cut

__PACKAGE__->meta->make_immutable;
no Mouse;
1;
