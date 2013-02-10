ssh_options[:port] = 2222
server "localhost", :web, :app, :db, :primary => true
