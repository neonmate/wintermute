[![Build Status](https://travis-ci.org/neonmate/wintermute.svg?branch=master)](https://travis-ci.org/neonmate/wintermute)

# Wintermute
Wintermute should help programmers to create open source web applications that become an active side project.

# Development

## Setup

- Install Ruby e.g. `rbenv install 2.6.5`
- Install [PostgreSQL 10](https://www.postgresql.org/download/)
- Install [Node via NVM](https://github.com/nvm-sh/nvm#install--update-script) and run `nvm use` to use the projects Node version
- Install [yarn](https://yarnpkg.com/lang/en/docs/install/)
- Install bundler `gem install bundler -v '2.1.4'`
- Add all environment variables from the `secrets.yml` to your `.bashrc` or `.zshrc`
- Run `bundle exec bin/setup`
- Run server `bundle exec bin/rails s` and go to [http://wintermute.vcap.me:3000/](http://wintermute.vcap.me:3000/)

## Deployment

```
bundle exec cap production deploy
```

# Mails

Preview all emails at http://localhost:3000/rails/mailers .

## Tests

Install `chromedriver` and add it to the path variables.

- Run all tests with `bundle exec rake`
  - Run unit tests with `bundle exec parallel:spec`
  - Run integration tests with `bundle exec parallel:feature`

Debugging hint: You can disable headless mode for javascript tests with `CHROME_HEADLESS=false bundle exec cucumber`.
