require "rvm/capistrano"
require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require 'capistrano_colors'

load 'deploy'
set :rvm_ruby_string, "1.9.3@webshop"
set :stages, %w(staging production)
set :default_stage, 'production'
task :staging do
  set :stage, 'staging'
end
task :production do
  set :stage, 'production'
  set :branch, 'master'
end
set :application, 'webshop'
# set :deploy_via, :remote_cache
set :scm, :git
set :repository, "git@github.com:hieunh1989/webshop.git"
set :domain, 'congsc.com'
set :user, 'eric'
set :deploy_to, "/home/eric/#{application}"
set :chmod755, 'app config db lib public'
set :use_sudo, false
set :bundle_flags,    ""
role :web, domain
role :app, domain
role :db,  domain, :primary => true
namespace :bundle do
  task :install, :roles => [:app] do
    run "cd #{release_path} && bundle install --without development test deploy"
  end
end
namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end
namespace :dragonfly do
  desc "Symlink the Rack::Cache files"
  task :symlink, :roles => [:app] do
    run "mkdir -p #{shared_path}/tmp/dragonfly && ln -nfs #{shared_path}/tmp/dragonfly #{release_path}/tmp/dragonfly"
    run "mkdir -p #{shared_path}/data && ln -nfs #{shared_path}/data #{release_path}/public/data"
  end
end
namespace :deploy do
  task :restart, :roles => [:app]  do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
namespace :assets do
  task :precompile, :roles => [:app] do
    run "cd #{release_path} && bundle exec rake assets:precompile RAILS_ENV=#{stage}"
  end
end
after 'deploy:update_code', 'rvm:trust_rvmrc', 'dragonfly:symlink', 'assets:precompile'
after 'deploy', 'deploy:cleanup'

