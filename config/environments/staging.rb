require_relative 'production'

Rails.application.configure do
  config.action_mailer.default_url_options = { host: 'wintermute-staging.makandra.de', protocol: 'https://' }
end
