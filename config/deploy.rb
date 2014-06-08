set :application, "stori"
set :repository, 'https://github.com/bystam/stori.git'
set :scm, :git

set :branch, fetch(:branch, 'master')

set :stages, ['production']
set :default_stage, 'production'
require 'capistrano/ext/multistage'

webfactional_domain = 'studs.webfactional.com'
role :app, webfactional_domain, :alias => 'webfactional'
role :web, webfactional_domain, :alias => 'webfactional'
role :db,  webfactional_domain, :alias => 'webfactional', :primary => true

set :user, "studs"
set :scm_username, "bystam"
set :use_sudo, false
default_run_options[:pty] = true

set :rails_env, 'production'
default_environment['RAILS_ENV'] = 'production'

# Bundler
require 'bundler/capistrano'


# Additional shared paths
set :shared_children, shared_children + %w(public/uploads)
set :shared_files, %w(config/database.yml)
set(:shared_file_path) { shared_path }
require 'capistrano/shared_file'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

namespace :deploy do
  desc "Deploy"
  task :default do
    update
    restart
    clear_cache
  end
  
  desc "Restart nginx"
  task :restart do
    run "#{deploy_to}/bin/restart"
  end

end
