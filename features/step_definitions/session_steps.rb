Given('I am signed in on Github with the nickname {string} and the email {string}') do |nickname, email|
  OmniAuth.config.add_mock(:github, { uid: '12345', info: { nickname: nickname, email: email } })
end


When(/^I am signed in(?: as (admin))?(?: with the(?: email "([^"]*)")?)?(?: (?:with the|and the)(?: nickname "([^"]*)")?)?$/) do |admin, email, nickname|
  nickname ||= 'thomas'
  email ||= 'thomas@example.com'
  FactoryBot.create(:user, uid: '12345', admin: admin.present?, nickname: nickname, email: email)

  step(%(I go to the homepage))
  step(%(I am signed in on Github with the nickname "#{nickname}" and the email "#{email}"))
  step(%(I follow "Sign in"))
end
