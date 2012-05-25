worker_processes 4

listen 8080, :tcp_nopush => true
timeout 120

preload_app true

app_name = "hello"
base_path = "/home/hello/app"
working_directory "#{base_path}/#{app_name}/current"
pid "#{base_path}/#{app_name}/shared/pids/unicorn.pid"
stderr_path "#{base_path}/#{app_name}/shared/log/unicorn.stderr.log"
stdout_path "#{base_path}/#{app_name}/shared/log/unicorn.stdout.log"  

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  
  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      # SIGTTOU だと worker_processes が多いときおかしい気がする
      Process.kill :QUIT, File.read(old_pid).to_i
      rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end