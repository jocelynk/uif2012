require 'bundler/capistrano'

server 'urbanimpact.hss.cmu.edu', :web, :app, :db, primary: true

set :application, 'uif2012'
set :user, 'root'
set :group, 'admin'
set :deploy_to, "/home/deploy/apps/#{application}"

set :scm, 'git'
set :git_enable_submodules, 1
set :deploy_via, :remote_cache
set :repository, "git@github.com:cmu-is-projects/#{application}.git"
set :branch, 'capistrano'

# share public/uploads
set :shared_children, shared_children + %w{public/uploads}

# allow password prompt
default_run_options[:pty] = true

# turn on key forwarding
ssh_options[:forward_agent] = true

# keep only the last 5 releases
after 'deploy', 'deploy:cleanup'

# unicorn
namespace :unicorn do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: { no_release: true } do
      # run "#{try_sudo} /etc/init.d/unicorn_#{application} #{command}"
      run "chmod 775 /home/deploy/apps/uif2012/current/config/deploy/nginx.conf"
      run "chmod 775 /home/deploy/apps/uif2012/current/config/deploy/unicorn.rb"
      run "chmod 775 /home/deploy/apps/uif2012/current/config/deploy/unicorn_init.sh"
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :symlinks do
    run "#{try_sudo} ln -nfs #{current_path}/config/deploy/nginx.conf /etc/nginx/sites-enabled/#{application}"
    run "#{try_sudo} ln -nfs #{current_path}/config/deploy/unicorn_init.sh /etc/init.d/unicorn_#{application}"
  end
end
after 'deploy', 'unicorn:symlinks'
after 'deploy', 'unicorn:restart'