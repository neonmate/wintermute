Given('I am signed in on Github with the nickname {string} and the email {string}') do |nickname, email|
  OmniAuth.config.add_mock(:github, {uid: '12345', info: {nickname: nickname, email: email}})
end
