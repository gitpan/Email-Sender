
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
                       'VERSION' => '0.100450',
                       'LICENSE' => 'perl',
                       'PREREQ_PM' => {
                                        'Capture::Tiny' => '0',
                                        'Sub::Exporter' => 0,
                                        'Config' => 0,
                                        'Email::Abstract' => '3',
                                        'File::Path' => '0',
                                        'Email::Simple' => '1.998',
                                        'List::MoreUtils' => '0',
                                        'Errno' => 0,
                                        'Test::MockObject' => 0,
                                        'Moose::Role' => 0,
                                        'Try::Tiny' => '0',
                                        'IO::File' => 0,
                                        'ExtUtils::MakeMaker' => '6.11',
                                        'Data::Dumper' => 0,
                                        'Test::More' => 0,
                                        'Email::Sender::Transport::SMTP_X' => 0,
                                        'Test::Email::SMTPRig' => 0,
                                        'File::Temp' => '0',
                                        'Test::Email::Sender::Util' => 0,
                                        'Scalar::Util' => '0',
                                        'FindBin' => '0',
                                        'Fcntl' => '0',
                                        'File::Spec' => '0',
                                        'IO::Handle' => 0,
                                        'Throwable::Error' => '0.100090',
                                        'Sub::Override' => 0,
                                        'File::Find' => '0',
                                        'Sys::Hostname::Long' => '0',
                                        'Moose' => '0.70',
                                        'Exporter' => 0,
                                        'Carp' => '0',
                                        'Sub::Exporter::Util' => 0,
                                        'Net::SMTP' => '0',
                                        'JSON' => 0,
                                        'File::Basename' => '0',
                                        'Net::SMTP::SSL' => 0,
                                        'Test::MinimumVersion' => 0,
                                        'Sys::Hostname' => 0,
                                        'Email::Address' => '0',
                                        'Cwd' => '0'
                                      }
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



