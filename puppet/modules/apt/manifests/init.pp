# updates apt
class apt {
  # update apt or mysql install will fail
  exec { 'apt_update':
    command => '/usr/bin/apt-get update',
  }
}
