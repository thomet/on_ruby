require 'capistrano-unicorn'

after 'deploy:restart', 'unicorn:reload'
