use strict;
use warnings;
use Test::More 0.88;
# This is a relatively nice way to avoid Test::NoWarnings breaking our
# expectations by adding extra tests, without using no_plan.  It also helps
# avoid any other test module that feels introducing random tests, or even
# test plans, is a nice idea.
our $success = 0;
END { $success && done_testing; }

# List our own version used to generate this
my $v = "\nGenerated by Dist::Zilla::Plugin::ReportVersions::Tiny v1.08\n";

eval {                     # no excuses!
    # report our Perl details
    my $want = "any version";
    $v .= "perl: $] (wanted $want) on $^O from $^X\n\n";
};
defined($@) and diag("$@");

# Now, our module version dependencies:
sub pmver {
    my ($module, $wanted) = @_;
    $wanted = " (want $wanted)";
    my $pmver;
    eval "require $module;";
    if ($@) {
        if ($@ =~ m/Can't locate .* in \@INC/) {
            $pmver = 'module not found.';
        } else {
            diag("${module}: $@");
            $pmver = 'died during require.';
        }
    } else {
        my $version;
        eval { $version = $module->VERSION; };
        if ($@) {
            diag("${module}: $@");
            $pmver = 'died during VERSION check.';
        } elsif (defined $version) {
            $pmver = "$version";
        } else {
            $pmver = '<undef>';
        }
    }

    # So, we should be good, right?
    return sprintf('%-45s => %-10s%-15s%s', $module, $pmver, $wanted, "\n");
}

eval { $v .= pmver('Capture::Tiny','0.08') };
eval { $v .= pmver('Carp','any version') };
eval { $v .= pmver('Cwd','any version') };
eval { $v .= pmver('Email::Abstract','3') };
eval { $v .= pmver('Email::Address','any version') };
eval { $v .= pmver('Email::Simple','1.998') };
eval { $v .= pmver('ExtUtils::MakeMaker','6.30') };
eval { $v .= pmver('Fcntl','any version') };
eval { $v .= pmver('File::Basename','any version') };
eval { $v .= pmver('File::Find','any version') };
eval { $v .= pmver('File::Path','any version') };
eval { $v .= pmver('File::Spec','any version') };
eval { $v .= pmver('File::Temp','any version') };
eval { $v .= pmver('FindBin','any version') };
eval { $v .= pmver('List::MoreUtils','any version') };
eval { $v .= pmver('Module::Runtime','any version') };
eval { $v .= pmver('Moo','1.000008') };
eval { $v .= pmver('Moo::Role','any version') };
eval { $v .= pmver('MooX::Types::MooseLike','0.15') };
eval { $v .= pmver('Net::SMTP','any version') };
eval { $v .= pmver('Scalar::Util','any version') };
eval { $v .= pmver('Sub::Override','any version') };
eval { $v .= pmver('Sys::Hostname','any version') };
eval { $v .= pmver('Test::More','0.96') };
eval { $v .= pmver('Test::Pod','1.41') };
eval { $v .= pmver('Throwable::Error','0.200003') };
eval { $v .= pmver('Try::Tiny','any version') };
eval { $v .= pmver('version','0.9901') };


# All done.
$v .= <<'EOT';

Thanks for using my code.  I hope it works for you.
If not, please try and include this output in the bug report.
That will help me reproduce the issue and solve your problem.

EOT

diag($v);
ok(1, "we really didn't test anything, just reporting data");
$success = 1;

# Work around another nasty module on CPAN. :/
no warnings 'once';
$Template::Test::NO_FLUSH = 1;
exit 0;
