require 'bundler/capistrano'

# load 'config/recipes/output'

server 'urbanimpact.hss.cmu.edu', :web, :app, :db, primary: true

ssh_options[:forward_agent] = true
default_run_options[:pty]   = true

set :application, 'urban-impact'
set :repository,  'git@github.com:cmu-is-projects/uif2012.git'
set :branch,      'production'
set :deploy_to,   "/var/www/#{application}"

set :user,  'deploy'
set :group, 'deploy'
set :use_sudo, false
set :deploy_via, :remote_cache

after 'deploy:restart','deploy:cleanup'

namespace :deploy do
  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after 'deploy:finalize_update', 'deploy:symlink_config'
end

after 'deploy', 'unicorn:reload'
after 'deploy', 'nginx:reload'

namespace :unicorn do
  %w(start stop restart reload).each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: { no_release: true } do
      run "#{shared_path}/unicorn #{command}"
    end
  end
end

namespace :nginx do
  %w(start stop restart reload).each do |command|
    desc "#{command} nginx"
    task command, roles: :app, except: { no_release: true } do
      run "sudo service nginx #{command}"
    end
  end
end
