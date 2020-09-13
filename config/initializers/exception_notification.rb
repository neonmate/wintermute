require 'exception_notification/rails'

ExceptionNotification.configure do |config|

  config.add_notifier :email, {
    email_prefix: '[wintermute] ',
    # Simple email obfuscation to prevent spam
    exception_recipients: [[100, 101, 118, 64, 100, 101, 110, 122, 101, 108, 46, 101, 109, 97, 105, 108].pack('c*')],
    sender_address: Rails.configuration.system_email,
    sections: ['request', 'data', 'backtrace'],
    background_sections: ['data', 'backtrace'],
  }

  # Regularly occurs when users have multiple tabs open
  config.ignored_exceptions += [ActionController::InvalidAuthenticityToken]

end
