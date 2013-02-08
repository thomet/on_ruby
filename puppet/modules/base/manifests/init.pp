# installs some basic tools and performs basic setup
class base {
  file { '/etc/hosts':
    source => 'puppet:///modules/base/hosts'
  }
  package { 'vim':
    ensure => present,
  }
  package { 'rubygems':
    ensure => present,
  }
  # needed for asset-pipeline
  package { 'nodejs':
    ensure => installed,
  }
}
