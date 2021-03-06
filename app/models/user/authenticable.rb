class User::Authenticable < ActiveType::Record[User]

  def self.authenticate(authorize_params)
    user = find_by(uid: authorize_params.fetch('uid'))

    user.presence || create!(
      uid: authorize_params.fetch('uid'),
      email: authorize_params.fetch('info').fetch('email'),
      nickname: authorize_params.fetch('info').fetch('nickname')
    )
  end

end
