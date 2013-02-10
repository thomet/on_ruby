set :stages, %w(production vagrant)
set :default_stage, "vagrant"

require 'capistrano/ext/multistage'
