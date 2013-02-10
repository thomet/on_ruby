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

namespace :deploy do
  task :copy_production_configs, :roles => :app, :except => { :no_release => true } do
    run "cp #{shared_path}/config/secret.properties #{latest_release}/config/"
  end
end
before "deploy:assets:precompile", "deploy:copy_production_configs"
