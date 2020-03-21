class ApplicationMailer < ActionMailer::Base

  # Allow to group all mailer templates in a folder
  prepend_view_path 'app/views/mailers'

  default from: Rails.configuration.system_email
  layout 'mailer'
end
