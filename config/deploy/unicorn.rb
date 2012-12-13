# working_directory '/var/www/urban-impact/current'
# stderr_path '/var/log/unicorn/urban-impact-error.log'
# stdout_path '/var/log/unicorn/urban-impact.log'
# pid '/var/www/urban-impact/shared/pids/unicorn.pid'
# 
# listen '/var/www/urban-impact/shared/sockets/unicorn.sock', :backlog => 2048
# worker_processes 4
# timeout 30
# preload_app true
# 
# before_fork do |server, worker|
#   # the following is highly recomended for Rails + "preload_app true"
#   # as there's no need for the master process to hold a connection
#   defined?(ActiveRecord::Base) and
#     ActiveRecord::Base.connection.disconnect!
# 
#   # The following is only recommended for memory/DB-constrained
#   # installations.  It is not needed if your system can house
#   # twice as many worker_processes as you have configured.
#   #
#   # # This allows a new master process to incrementally
#   # # phase out the old master process with SIGTTOU to avoid a
#   # # thundering herd (especially in the "preload_app false" case)
#   # # when doing a transparent upgrade.  The last worker spawned
#   # # will then kill off the old master process with a SIGQUIT.
#   # old_pid = "#{server.config[:pid]}.oldbin"
#   # if old_pid != server.pid
#   #   begin
#   #     sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
#   #     Process.kill(sig, File.read(old_pid).to_i)
#   #   rescue Errno::ENOENT, Errno::ESRCH
#   #   end
#   # end
#   #
#   # Throttle the master from forking too quickly by sleeping.  Due
#   # to the implementation of standard Unix signal handlers, this
#   # helps (but does not completely) prevent identical, repeated signals
#   # from being lost when the receiving process is busy.
#   # sleep 1
# end
# 
# after_fork do |server, worker|
#   # per-process listener ports for debugging/admin/migrations
#   # addr = "127.0.0.1:#{9293 + worker.nr}"
#   # server.listen(addr, :tries => -1, :delay => 5, :tcp_nopush => true)
# 
#   # the following is *required* for Rails + "preload_app true",
#   defined?(ActiveRecord::Base) and
#     ActiveRecord::Base.establish_connection
# 
#   # if preload_app is true, then you may also want to check and
#   # restart any other shared sockets/descriptors such as Memcached,
#   # and Redis.  TokyoCabinet file handles are safe to reuse
#   # between any number of forked children (assuming your kernel
#   # correctly implements pread()/pwrite() system calls)
# end
######################################################################
# Set environment to production unless something else is specified
env = ENV['RAILS_ENV'] || 'production'

# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.
worker_processes 4

# listen on both a Unix domain socket and a TCP port,
# we use a shorter backlog for quicker failover when busy
listen '/tmp/uif2012.socket', :backlog => 64

# Preload our app for more speed
preload_app true

# nuke workers after 30 seconds instead of 60 seconds (the default)
timeout 30

pid '/tmp/unicorn.uif2012.pid'

# Production specific settings
if env == 'production'
  # Help ensure your application will always spawn in the symlinked
  # "current" directory that Capistrano sets up.
  working_directory '/home/deploy/apps/uif2012/current'

  # feel free to point this anywhere accessible on the filesystem
  user 'deploy', 'admin'
  shared_path = '/home/deploy/apps/uif2012/shared'

  stderr_path "#{shared_path}/log/unicorn.uif2012.stderr.log"
  stdout_path "#{shared_path}/log/unicorn.uif2012.stdout.log"
end

before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
  old_pid = '/tmp/unicorn.uif2012.pid.oldbin'
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  # the following is *required* for Rails + "preload_app true",
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end

  # if preload_app is true, then you may also want to check and
  # restart any other shared sockets/descriptors such as Memcached,
  # and Redis.  TokyoCabinet file handles are safe to reuse
  # between any number of forked children (assuming your kernel
  # correctly implements pread()/pwrite() system calls)
end
