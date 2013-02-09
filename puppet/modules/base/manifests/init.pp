# installs some basic tools and performs basic setup
class base {
  file { '/etc/hosts':
    source => 'puppet:///modules/base/hosts',
  }
  package { 'vim':
    ensure => present,
  }
  # needed for asset-pipeline
  package { 'nodejs':
    ensure => installed,
  }
  # set the timezone infos properly (http://serverfault.com/questions/84521/automate-dpkg-reconfigure-tzdata)
  file { '/etc/timezone':
    source => 'puppet:///modules/base/timezone',
  }
  exec { 'configure_timezone':
    command => 'dpkg-reconfigure -f noninteractive tzdata',
    subscribe => File['/etc/timezone'],
  }
}
