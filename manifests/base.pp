File {
  owner => root,
  group => root,
  mode  => 0644,
}
Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
}

stage { 'first':
  before => Stage['main'] # <- das hier ist die default stage
}

node "onruby" {
  class { 'base': stage => first }
  include heroku
  include capistrano
  include apache2
  include passenger
  include memcache
  include mysql
}
