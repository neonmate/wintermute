require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
# require 'active_job/railtie'
require 'active_record/railtie'
# require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
# require 'action_mailbox/engine'
# require 'action_text/engine'
require 'action_view/railtie'
# require 'action_cable/engine'
# require 'sprockets/railtie'
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wintermute
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths << "#{Rails.root}/app/controllers/shared"
    config.autoload_paths << "#{Rails.root}/app/models/shared"
    config.autoload_paths << "#{Rails.root}/app/util"
    config.autoload_paths << "#{Rails.root}/app/util/shared"

    config.eager_load_paths << "#{Rails.root}/app/models/shared"

    config.system_email = 'neonmate@users.noreply.github.com'

    config.time_zone = 'Berlin'
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_attributes = false

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Allow subfolders for i18n (We use a folder for each locale)
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    # Disable encrypted credentials
    config.read_encrypted_secrets = false
    config.require_master_key = false

    # Adjust generator like described in http://guides.rubyonrails.org/generators.html
    config.generators do |g|
      g.test_framework :rspec
      g.controller_specs false
      g.request_specs false
      g.helper_specs false
      g.feature_specs false
      g.mailer_specs false
      g.model_specs false
      g.observer_specs false
      g.routing_specs false
      g.view_specs false
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.assets false
      g.fixture_replacement :factory_bot
    end
  end
end
