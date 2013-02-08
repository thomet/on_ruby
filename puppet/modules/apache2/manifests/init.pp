# installs and configures default apache2
class apache2 {
  package { 'apache2':
    ensure  => present,
    before  => Package['libapache2-mod-passenger'],
  }
  # TODO (ps) how to pass ENV varaibles now?
  package { 'libapache2-mod-passenger':
    ensure  => present,
  }
  service { 'apache2':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    subscribe  => File['/etc/apache2/sites-enabled/onruby.conf'],
  }
  file { '/etc/apache2/sites-enabled/onruby.conf':
    ensure => present,
    source => 'puppet:///modules/apache2/onruby.conf',
  }
  file { '/etc/apache2/sites-enabled/000-default':
    ensure => absent,
    before => Service['apache2'];
  }
}
