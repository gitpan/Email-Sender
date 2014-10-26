use Test::More tests => 12;

BEGIN {
  use_ok('Email::Sender');
  use_ok('Email::Sender::Transport::DevNull');
  use_ok('Email::Sender::Transport::Failable');
  use_ok('Email::Sender::Transport::Maildir');
  use_ok('Email::Sender::Transport::Mbox');
  use_ok('Email::Sender::Transport::Print');
  use_ok('Email::Sender::Transport::SMTP');
  use_ok('Email::Sender::Transport::SMTP::Persistent');
  use_ok('Email::Sender::Transport::SQLite');
  use_ok('Email::Sender::Transport::Sendmail');
  use_ok('Email::Sender::Transport::Test');
  use_ok('Email::Sender::Transport::Wrapper');
}

