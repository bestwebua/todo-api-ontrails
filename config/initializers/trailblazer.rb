require 'reform'
# require 'reform/form/dry'

Rails.application.configure do
  config.trailblazer.enable_loader = false
  config.trailblazer.application_controller = 'ApiController'
end
