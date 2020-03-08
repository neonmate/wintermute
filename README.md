[![Build Status](https://travis-ci.org/neonmate/wintermute.svg?branch=master)](https://travis-ci.org/neonmate/wintermute)

# Wintermute
Wintermute is a platform to pitch and find open-source web applications.

# Development

## Setup

- Install Ruby e.g. `rbenv install 2.6.5`
- Install [PostgreSQL 10](https://www.postgresql.org/download/)
- Install [Node via NVM](https://github.com/nvm-sh/nvm#install--update-script) and run `nvm use` to use the projects Node version
- Install [yarn](https://yarnpkg.com/lang/en/docs/install/)
- Install bundler `gem install bundler -v '2.1.4'`
- Run `bundle exec bin/setup`
- Run server `bundle exec bin/rails s` and go to [http://wintermute.vcap.me:3000/](http://wintermute.vcap.me:3000/)

## Deployment

```
git push heroku
heroku run rails db:migrate
```

You need to set the master encryption key before a first deployment:

```
heroku config:set RAILS_MASTER_KEY=secure-master-key
```

## Credentials

We use encrypted credentials for production and staging. And we use unencrypted credentials for development and test.
Run `bin/setup` to create an initial `config/secrets.yml`. You can both access secrets and credentials via
`Rails.application.credentials.some_key`.

## Tests

Install `chromedriver` and add it to the path variables.

- Run all tests with `bundle exec rake`
  - Run unit tests with `bundle exec parallel:spec`
  - Run integration tests with `bundle exec parallel:feature`

Debugging hint: You can disable headless mode for javascript tests with `CHROME_HEADLESS=false bundle exec cucumber`.
