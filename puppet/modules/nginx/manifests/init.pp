class nginx {
  package { 'nginx':
    ensure  => present,
  }
  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    subscribe  => File['/etc/nginx/sites-enabled/onruby.conf'],
  }
  file { '/etc/nginx/sites-enabled/onruby.conf':
    ensure => present,
    source => 'puppet:///modules/nginx/onruby.conf',
  }
}
