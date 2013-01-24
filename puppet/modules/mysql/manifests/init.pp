class mysql {
  package { "mysql-server":
    ensure  => installed,
    before  => File["/etc/mysql/my.cnf"],
  }
  service { "mysql":
    ensure    => running,
    subscribe => File["/etc/mysql/my.cnf"],
  }
  file { "/etc/mysql/my.cnf":
    source => "puppet:///modules/mysql/my.cnf",
  }
  exec { "mysql_password":
    unless  => "mysqladmin -uroot -proot status",
    command => "mysqladmin -uroot password root",
    require => Service[mysql],
  }
  exec { "onruby_db":
    unless  => "mysql -uroot -proot onruby_production",
    command => "mysql -uroot -proot -e 'create database onruby_production'",
    require => Exec[mysql_password],
  }
}