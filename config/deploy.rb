lock '~> 3.15.0'

abort 'You must run this using "bundle exec ..."' unless ENV['BUNDLE_BIN_PATH'] || ENV['BUNDLE_GEMFILE']

set :application, 'wintermute'
set :repo_url, 'git@github.com:neonmate/wintermute.git'
set :keep_releases, 5
set :ssh_options, forward_agent: true
set :log_level, :info

append :linked_files, 'config/database.yml', 'config/secrets.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'storage'

# https://makandracards.com/makandra/100898-fix-for-rails-assets-manifest-file-not-found-in-capistrano-deploy
Rake::Task['deploy:assets:backup_manifest'].clear_actions
