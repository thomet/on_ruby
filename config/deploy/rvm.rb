require 'rvm/capistrano'

set :rvm_type, :user
set :rvm_install_type, :stable
set :rvm_install_ruby, :install
set :rvm_ruby_string, 'ruby-1.9.3-p385@on_ruby'

before 'deploy:setup', 'rvm:install_rvm'
before 'deploy:setup', 'rvm:install_ruby'
