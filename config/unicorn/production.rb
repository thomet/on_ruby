# TODO (ps) remove this and use hiera for it
props = File.readlines('/var/onruby/current/config/secret.properties').map(&:chomp)
props.each do |line|
  key, value = line.split('=')
  ENV[key] = value
end

worker_processes 4
working_directory "/var/onruby/current" # available in 0.94.0+
listen "/tmp/.sock", :backlog => 64
timeout 30
pid "/var/onruby/shared/pids/unicorn.pid"
stderr_path "/var/onruby/shared/log/unicorn.stderr.log"
stdout_path "/var/onruby/shared/log/unicorn.stdout.log"
preload_app true
GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end
after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
