require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'

Bundler.require(*Rails.groups)

module TodoApiOntrails
  class Application < Rails::Application
    config.load_defaults 5.2
    config.api_only = true
    config.active_job.queue_adapter = :sidekiq
    config.test_framework = :rspec

    config.i18n.load_path += Dir["#{Rails.root}/config/locales/**/*.{rb,yml}"]
    config.autoload_paths += Dir["#{config.root}/app/**/"]
  end
end

Sidekiq::Cron::Job.create(
  name: 'Erase not verificated users - every 24h',
  cron: '* */24 * * *',
  class: 'V1::Users::EraseNotVerificatedUsersWorker'
)
