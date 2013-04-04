class rvm {
  $requirements = ['git-core', 'libreadline6-dev', 'libyaml-dev', 'sqlite3', 'libxml2-dev', 'libxslt1-dev', 'autoconf', 'libgdbm-dev', 'libncurses5-dev', 'automake', 'libtool', 'bison', 'libffi-dev']
  package { $requirements:
    ensure => "installed"
  }
}
