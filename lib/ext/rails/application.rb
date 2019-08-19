module CredentialExtension
  # We want to use unencrypted secrets for development and test. Otherwise encrypted secrets.
  def credentials
    if ['development', 'test'].include?(Rails.env)
      secrets
    else
      super
    end
  end
end

Rails::Application.prepend(CredentialExtension)
