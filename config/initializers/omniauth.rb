# In development the callback URL is http://wintermute.vcap.me:3000/
Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer if Rails.env.developer?
  provider(
    :github,
    Rails.application.legacy_secrets.github_client_id,
    Rails.application.legacy_secrets.github_client_secret,
    scope: 'user:email'
  )
end

OmniAuth.config do |config|
  # Disable the redirect to /auth/failure and always raise
  config.failure_raise_out_environments = ['test', 'development', 'staging', 'production']
end
