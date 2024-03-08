require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module CoopaerApi
  class Application < Rails::Application
    config.load_defaults 7.0

    config.autoload_paths << "#{config.root}/app/services"
    config.api_only = true
  end
end
