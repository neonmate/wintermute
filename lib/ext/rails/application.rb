module LegacySecretsExtension

  # Add a new accessor to get decrypted credentials for the current environment (Will be fixed in Rails 6)
  def legacy_secrets
    @decrypted_secrets ||= begin
      ActiveSupport::InheritableOptions.new(credentials.public_send(Rails.env))
    end
  end

end

module Rails
  Application.prepend(LegacySecretsExtension)
end
