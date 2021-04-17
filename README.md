# Wintermute [![Tests](https://github.com/neonmate/wintermute/workflows/Tests/badge.svg)](https://github.com/neonmate/wintermute/actions)
Wintermute links to the most common open source web applications published on Github. It should help you to find new and alternative web services that you can use in trust as a service or host in your own infrastructure.

![Screenshot of Wintermute in a browser](/docs/screenshot.png?raw=true)

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

## Mail Previews

Preview all emails at http://localhost:3000/rails/mailers in development.

## Tests

Install `chromedriver` and add it to the path variables.

- Run all tests with `bundle exec rake`
- Run unit tests with `bundle exec parallel:spec`
- Run integration tests with `bundle exec parallel:feature`

Debugging hint: You can disable headless mode for javascript tests with `CHROME_HEADLESS=false bundle exec cucumber`.
