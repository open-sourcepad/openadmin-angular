set :stage, :production
set :rails_env, 'production'
set :branch, "staging"

server '<insert_server_ip>',
  user: 'deploy',
  roles: %w{web app db},
  ssh_options: {
    proxy: Net::SSH::Proxy::Command.new('')
  }
