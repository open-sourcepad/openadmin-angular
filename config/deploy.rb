require 'net/ssh/proxy/command'

# config valid only for Capistrano 3.1
lock '3.4.0'

set :application, '<insert_app_name>'
set :repo_url, '<insert repo>'
set :deploy_via, :remote_cache
set :bundle_without, [:development, :test]

set :log_level, :debug
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle config/thin}

set :keep_releases, 1
set :bundle_gemfile, -> { release_path.join('Gemfile') }
set :bundle_flags, '--deployment'

set :rvm_ruby_version, '2.3.0@<insert_app_name>'
set :deploy_to, "/home/deploy/<insert_app_name>"


load "config/deploy/tasks.rb"

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

namespace :deploy do
  after :publishing, :restart
end
