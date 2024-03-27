require_relative 'boot'
require_relative '../lib/yaml_loader'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TourAvailabilityCalendar
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.yaml_loader = CustomYamlLoader
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

     # Session store configuration
     config.session_store :cookie_store, key: 'tour_availability_calendar'
  end
end
