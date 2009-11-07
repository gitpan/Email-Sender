
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  DISTNAME  => 'Email-Sender',
  NAME      => 'Email::Sender',
  AUTHOR    => "Ricardo\ Signes\ \<rjbs\@cpan\.org\>",
  ABSTRACT  => "a\ library\ for\ sending\ email",
  VERSION   => '0.093110',
  EXE_FILES => [ qw() ],
  (eval { ExtUtils::MakeMaker->VERSION(6.31) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Scalar::Util" => '0',
    "Capture::Tiny" => '0',
    "FindBin" => '0',
    "Fcntl" => '0',
    "File::Spec" => '0',
    "Email::Abstract" => '3',
    "File::Find" => '0',
    "File::Path" => '0',
    "Email::Simple" => '1.998',
    "List::MoreUtils" => '0',
    "Moose" => '0',
    "Sys::Hostname::Long" => '0',
    "Carp" => '0',
    "Net::SMTP" => '0',
    "File::Temp" => '0',
    "File::Basename" => '0',
    "Email::Address" => '0',
    "Cwd" => '0',
  },
  test => {TESTS => 't/*.t'}
);

