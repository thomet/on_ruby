require 'bundler/capistrano'

set :stages, %w(production vagrant)
set :default_stage, "vagrant"

require 'capistrano/ext/multistage'

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

after "deploy:restart", "deploy:cleanup"

namespace :deploy do
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

