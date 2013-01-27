# encoding: utf-8
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require "rake"

OnRuby::Application.load_tasks

desc "lint puppet"
task :puppet_lint do
  sh 'puppet-lint --no-80chars-check --with-filename --with-context puppet'
end

desc "run puppet"
task :puppet_apply do
  sh 'sudo puppet apply --verbose --modulepath=puppet/modules puppet/manifests/base.pp'
end
