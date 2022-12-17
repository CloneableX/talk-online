require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TalkOnline
  class Application < Rails::Application
    # Configuration for rails generator
    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: false,
                       view_specs: false,
                       routing_specs: false,
                       helper_specs: false
      g.factory_bot false
      g.helper = false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    # Cancel css compressor
    config.assets.css_compressor = nil

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
