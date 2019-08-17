[![Build Status](https://travis-ci.org/neonmate/wintermute.svg?branch=master)](https://travis-ci.org/neonmate/wintermute)

# Wintermute
Wintermute is a platform to pitch and find open-source web applications.

# Development

## Setup

- Install [ruby 2.5.3](https://github.com/rbenv/rbenv#installation)
- Install [Node via NVM](https://github.com/nvm-sh/nvm#install--update-script) and run `nvm use` to use the projects Node version
- Install [yarn](https://yarnpkg.com/lang/en/docs/install/)
- Install bundler `gem install bundler`
- Run `bundle exec bin/setup`
- Run server `bundle exec bin/rails s` and go to [http://wintermute.vcap.me:3000/](http://wintermute.vcap.me:3000/)

## Deployment

```
git push heroku
heroku run rails db:migrate
```

You need to set the master encryption key before the first deployment:

```
heroku config:set RAILS_MASTER_KEY=secure-master-key
```

## Credentials

We use encrypted credentials for each env.

* Use `bin/rails credentials:edit --environment default` to add and read the current placeholder values. Do not add any
  sensitive data here.
* With `bin/setup` the default values are duplicated for each env. Afterwards it is possible to add sensitive data in
there to get a full working setup for test and development.
* Within the project credentials can be used with `Rails.application.credentials.some_key`

## Tests

- Install `chromedriver` and add it to path variables
- Run unit tests with `bundle exec rspec`
- Run integration tests with `bundle exec cucumber`

Debugging hint: You can disable headless mode for javascript tests with `CHROME_HEADLESS=false bundle exec cucumber`.
