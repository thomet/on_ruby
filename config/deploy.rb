require 'bundler/capistrano'

set :user,          "deployer"
set :group,         "deployer"
set :deploy_to,     "/var/onruby"
set :use_sudo,      false
set :deploy_via,    :copy
set :copy_strategy, :export
set :branch,        "puppet_and_capistrano"

set :application, "onruby"
set :scm,         :git
set :repository,  "https://github.com/phoet/on_ruby.git"

require 'rvm/capistrano'
require 'capistrano-unicorn'


# TODO use a stage for vagrant vm
ssh_options[:port] = 2222
server "localhost", :web, :app, :db, :primary => true
# server "176.58.97.120", :web, :app, :db, :primary => true

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :copy_production_configs, :roles => :app, :except => { :no_release => true }  do
    run "cp #{shared_path}/config/database.yml #{latest_release}/config/"
    run "cp #{shared_path}/config/secret.properties #{latest_release}/config/"
  end
end

before "deploy:assets:precompile", "deploy:copy_production_configs"

set :rvm_type, :user
set :rvm_install_type, :stable
set :rvm_install_ruby, :install
set :rvm_ruby_string, 'ruby-1.9.3-p385@on_ruby'

before 'deploy', 'rvm:install_rvm'
before 'deploy', 'rvm:install_ruby'
before 'deploy:setup', 'rvm:install_rvm'

after 'deploy:restart', 'unicorn:reload'

