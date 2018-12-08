source 'https://rubygems.org'
git_source(:github) { |repo_path| "https://github.com/#{repo_path}.git" }

# https://devcenter.heroku.com/articles/getting-started-with-rails5#specify-ruby-version-in-app
ruby '2.5.3'

gem 'active_type'
gem 'acts_as_paranoid'
gem 'assignable_values'
gem 'bootsnap', require: false
gem 'devise'
gem 'edge_rider'
gem 'exception_notification'
gem 'haml-rails'
gem 'has_defaults'
gem 'modularity'
gem 'omniauth-github'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'simple_form'
gem 'webpacker'
gem 'whenever'
gem 'will_paginate'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'listen'
  gem 'parallel_tests'
  gem 'spring'
  gem 'spring-commands-cucumber'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen'
  gem 'thin'
  gem 'web-console'
end

group :development, :test do
  gem 'pry-byebug'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'cucumber', '< 2.2' # Incompatible with Cucumber Factory
  gem 'cucumber-rails', require: false
  gem 'cucumber_factory'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rspec'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', require: false
  gem 'spreewald'
  gem 'timecop'
end
