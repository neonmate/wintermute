module OmniAuthControllerHelpers
  def sign_in(user)
    OmniAuth.config.add_mock(:github, { uid: user.uid, info: { nickname: user.nickname, email: user.email } })

    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:github]

    get '/auth/github/callback'
  end
end

OmniAuth.config.test_mode = true

RSpec.configure do |config|
  config.include OmniAuthControllerHelpers, type: :request

  config.before :each, type: :request do
    OmniAuth.config.mock_auth[:github] = nil
  end
end
