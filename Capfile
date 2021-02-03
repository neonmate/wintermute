require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'
require 'capistrano/opscomplete'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/passenger'
require 'capistrano/opscomplete'
require 'whenever/capistrano'

install_plugin Capistrano::SCM::Git

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |file| import file }

# https://github.com/makandra/capistrano-opscomplete
# See all commands from opscomplete with `bundle exec cap -T opscomplete`
after 'deploy:updating', 'opscomplete:ruby:ensure'
after 'deploy:updating', 'opscomplete:nodejs:ensure'
after 'deploy:reverting', 'opscomplete:ruby:ensure'
after 'deploy:reverting', 'opscomplete:nodejs:ensure'
