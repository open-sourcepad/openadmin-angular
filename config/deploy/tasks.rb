namespace :deploy do

   desc "Install bower"
   task :install_bower do
     on roles(:all) do
       execute "cd #{release_path}/client && bower install --save"
     end
   end

  desc "Create DB"
  task :create_db do
    on roles(:all) do
      execute "cd #{release_path} && ~/.rvm/bin/rvm #{fetch(:rvm_ruby_version)} do bundle exec rake RAILS_ENV=#{fetch(:rails_env)} db:create"
    end
  end

  before "deploy:migrate", 'deploy:create_db'
  before "deploy:compile_assets", "install_bower"

end
