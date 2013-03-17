
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "a library for sending email",
  "AUTHOR" => "Ricardo Signes <rjbs\@cpan.org>",
  "BUILD_REQUIRES" => {
    "Test::More" => "0.96"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Email-Sender",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Email::Sender",
  "PREREQ_PM" => {
    "Capture::Tiny" => "0.08",
    "Carp" => 0,
    "Cwd" => 0,
    "Email::Abstract" => 3,
    "Email::Address" => 0,
    "Email::Simple" => "1.998",
    "Fcntl" => 0,
    "File::Basename" => 0,
    "File::Find" => 0,
    "File::Path" => 0,
    "File::Spec" => 0,
    "File::Temp" => 0,
    "FindBin" => 0,
    "List::MoreUtils" => 0,
    "Module::Runtime" => 0,
    "Moo" => "1.000008",
    "Moo::Role" => 0,
    "MooX::Types::MooseLike" => "0.15",
    "Net::SMTP" => 0,
    "Scalar::Util" => 0,
    "Sub::Exporter" => 0,
    "Sys::Hostname" => 0,
    "Throwable::Error" => "0.200003",
    "Try::Tiny" => 0
  },
  "VERSION" => "1.300006",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



