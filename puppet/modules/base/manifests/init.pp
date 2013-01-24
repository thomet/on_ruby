# installs some basic tools and performs basic setup
class base {
  file { '/etc/hosts':
    source => 'puppet:///modules/base/hosts'
  }
  package { 'vim':
    ensure => present,
  }
  # needed for asset-pipeline
  package { 'nodejs':
    ensure => installed,
  }
  # update apt or mysql install will fail
  exec { 'apt_update':
    command => '/usr/bin/apt-get update',
  }
}
