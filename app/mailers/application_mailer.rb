class ApplicationMailer < ActionMailer::Base
  default from: Rails.configuration.system_email
  layout 'mailer'
end
