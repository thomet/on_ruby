# encoding: utf-8
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require "rake"

OnRuby::Application.load_tasks

desc "lint puppet"
task :lint do
  sh 'puppet-lint --no-80chars-check --with-filename --with-context puppet'
end
