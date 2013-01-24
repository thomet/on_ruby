# installs heroku toolbelt, used for migration from heroku
class heroku {
  exec { 'toolbelt':
    command => 'wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh',
    creates => '/usr/local/heroku/bin/heroku',
  }
}
