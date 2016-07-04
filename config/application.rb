require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'multi_json'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OpenAdmin
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    MultiJson.engine = :Oj

    config.middleware.delete "ActionDispatch::Cookies"
    config.middleware.delete "ActionDispatch::Session::CookieStore"
    config.middleware.delete "ActionDispatch::Flash"
    config.serve_static_files = true
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{**}')]
    config.autoload_paths += Dir[Rails.root.join('app', 'controllers', '{**}')]

    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.raise_in_transactional_callbacks = true
    config.angular_templates.inside_paths   = ['client/src']
    config.session_store :disabled
    # config.autoload_paths << Rails.root.join('app/models')
    # config.autoload_paths << Rails.root.join('app/controllers')
    config.action_mailer.preview_path = "#{Rails.root}/app/mailers/preview"
    config.active_job.queue_adapter = :sidekiq
    config.autoload_paths << Rails.root.join('app/services/**')
    config.generators do |g|
      g.template_engine nil #to skip views
      g.test_framework  nil #to skip test framework
      g.assets  false
      g.helper false
      g.stylesheets false
    end
  end
end
