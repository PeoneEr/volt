require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module TaskManagerTestApp
  class Application < Rails::Application
    config.time_zone = 'Krasnoyarsk'
    config.i18n.default_locale = :ru
  end
end
