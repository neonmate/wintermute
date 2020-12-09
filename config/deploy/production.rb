set :stage, :production
set :deploy_to, '/var/www/wintermute_p'
set :rails_env, 'production'
set :branch, ENV['DEPLOY_BRANCH'] || 'master'

server 'app01-prod.makandra.makandra.de', user: 'deploy-wintermute_p', roles: %w[app web cron db]
server 'app02-prod.makandra.makandra.de', user: 'deploy-wintermute_p', roles: %w[app web]
