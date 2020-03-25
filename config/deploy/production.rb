set :stage, :production
set :deploy_to, '/var/www/wintermute_p'
set :rails_env, 'production'
set :branch, ENV['DEPLOY_BRANCH'] || 'master'

server 'c23.makandra-3.makandra.de', user: 'deploy-wintermute_p', roles: %w[app web cron db]
server 'c42.makandra-3.makandra.de', user: 'deploy-wintermute_p', roles: %w[app web]
