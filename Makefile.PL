
use strict;
use warnings;



use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Email::Sender',
                       'DISTNAME' => 'Email-Sender',
                       'AUTHOR' => 'Ricardo Signes <rjbs@cpan.org>',
                       'ABSTRACT' => 'a library for sending email',
                       'EXE_FILES' => [],
                       'VERSION' => '0.100460',
                       'LICENSE' => 'perl',
                       'PREREQ_PM' => {
                                        'Scalar::Util' => '0',
                                        'Capture::Tiny' => '0',
                                        'FindBin' => '0',
                                        'File::Spec' => '0',
                                        'Fcntl' => '0',
                                        'Throwable::Error' => '0.100090',
                                        'File::Find' => '0',
                                        'Email::Abstract' => '3',
                                        'File::Path' => '0',
                                        'Email::Simple' => '1.998',
                                        'List::MoreUtils' => '0',
                                        'Moose' => '0.70',
                                        'Sys::Hostname::Long' => '0',
                                        'Try::Tiny' => '0',
                                        'ExtUtils::MakeMaker' => '6.11',
                                        'Carp' => '0',
                                        'Net::SMTP' => '0',
                                        'File::Temp' => '0',
                                        'File::Basename' => '0',
                                        'Email::Address' => '0',
                                        'Cwd' => '0'
                                      }
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



