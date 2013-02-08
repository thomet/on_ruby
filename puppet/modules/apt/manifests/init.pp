# updates apt and adds custom apt repos
class apt {
  # add brightbox repo for passenger etc http://wiki.brightbox.co.uk/docs:phusion-passenger
  file { '/etc/apt/sources.list.d/custom_sources.list':
    source => 'puppet:///modules/apt/custom_sources.list',
    before => Exec[apt_update],
  }
  exec { 'keyserver':
    command => 'sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6',
    before  => File['/etc/apt/sources.list.d/custom_sources.list'],
  }
  # update apt or mysql install will fail
  exec { 'apt_update':
    command => '/usr/bin/apt-get update',
  }
}
