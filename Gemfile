source 'https://rubygems.org'


gem 'rails'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'slim-rails'
gem 'bcrypt'
gem 'pg'
gem 'oj'
gem 'multi_json'
gem 'factory_girl_rails'
gem 'faker'
gem 'redis'
gem 'circleci'
gem 'sidekiq'
gem 'sidekiq-failures'
gem 'whenever'
gem 'aws-sdk'
gem 'paperclip'

gem 'angular-rails-templates'

group :production do
  gem 'thin'
end

group :development, :test do
  gem 'api_matchers'
  gem 'pry-rails'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-thin'
  gem 'capistrano-sidekiq'
  gem 'letter_opener'
  gem 'guard-rspec'
  gem 'rb-fsevent'
end

group :test do
  gem 'codeclimate-test-reporter', require: nil
  gem 'simplecov', require:  false
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'webmock'
end
