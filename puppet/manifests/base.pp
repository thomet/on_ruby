# default file settings
File {
  owner => root,
  group => root,
  mode  => 0644,
}
# default path settings
Exec {
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
}
# add a stage that runs before default stage
stage { 'first':
  before => Stage['main']
}
# configure the main node
node 'onruby' {
  class { 'apt': stage => first }
  include base
  include capistrano
  include nginx
  include memcache
  include mysql
}
