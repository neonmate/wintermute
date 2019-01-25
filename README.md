[![Build Status](https://travis-ci.org/neonmate/wintermute.svg?branch=master)](https://travis-ci.org/neonmate/wintermute)

# Wintermute
Wintermute is a platform to pitch and find open-source web applications.

# Development

## Setup

- Install ruby 2.5.3 [https://github.com/rbenv/rbenv#installation](https://github.com/rbenv/rbenv#installation)
- Install yarn [https://yarnpkg.com/lang/en/docs/install/](https://yarnpkg.com/lang/en/docs/install/)
- Install bundler `gem install bundler`
---
- Install dependencies with `bundle install` and `yarn install`
- Configure the `database.yml` file after `cp config/database.yml.sample config/database.yml`
- Migrate database `rake db:create db:migrate`
- Add the `master.key`
- Edit the secrets with `EDITOR="vim" bin/rails credentials:edit`
- Run server `rails s` and go to [http://wintermute.vcap.me:3000/](http://wintermute.vcap.me:3000/)

## Deployment

```
git push heroku
heroku run rails db:migrate
```

You need to set the master encryption key before the first deployment:

```
heroku config:set RAILS_MASTER_KEY=very-secret-and-secure
```

## Tests

- Install `chromedriver` and add it to path variables
- Run unit tests with `bundle exec rspec`
- Run integration tests with `bundle exec cucumber`

Debugging hint: You can disable headless mode for javascript tests with `CHROME_HEADLESS=false bundle exec cucumber`.
