class base {
  file { "/etc/hosts":
    source => "puppet:///modules/base/hosts"
  }
  package { "vim":
    ensure => present,
  }
  package { "nodejs":
    ensure => installed,
  }
  exec { "apt_update":
    command => "/usr/bin/apt-get update",
  }
}
