class ApplicationMailer < ActionMailer::Base
  default from: Rails.configuration.default_sender_email
  layout 'mailer'
end
