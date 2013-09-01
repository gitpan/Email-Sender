use strict;
use warnings;

# This test was generated via Dist::Zilla::Plugin::Test::Compile 2.018

use Test::More 0.88;



use Capture::Tiny qw{ capture };

my @module_files = qw(
Email/Sender.pm
Email/Sender/Failure.pm
Email/Sender/Failure/Multi.pm
Email/Sender/Failure/Permanent.pm
Email/Sender/Failure/Temporary.pm
Email/Sender/Manual.pm
Email/Sender/Manual/QuickStart.pm
Email/Sender/Role/CommonSending.pm
Email/Sender/Role/HasMessage.pm
Email/Sender/Simple.pm
Email/Sender/Success.pm
Email/Sender/Success/Partial.pm
Email/Sender/Transport.pm
Email/Sender/Transport/DevNull.pm
Email/Sender/Transport/Failable.pm
Email/Sender/Transport/Maildir.pm
Email/Sender/Transport/Mbox.pm
Email/Sender/Transport/Print.pm
Email/Sender/Transport/SMTP.pm
Email/Sender/Transport/SMTP/Persistent.pm
Email/Sender/Transport/Sendmail.pm
Email/Sender/Transport/Test.pm
Email/Sender/Transport/Wrapper.pm
Email/Sender/Util.pm
);

my @scripts = qw(

);

# no fake home requested

my @warnings;
for my $lib (@module_files)
{
    my ($stdout, $stderr, $exit) = capture {
        system($^X, '-Mblib', '-e', qq{require q[$lib]});
    };
    is($?, 0, "$lib loaded ok");
    warn $stderr if $stderr;
    push @warnings, $stderr if $stderr;
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};



done_testing;
