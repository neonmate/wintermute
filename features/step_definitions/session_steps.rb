Given('I am signed in on Github with the nickname {string} and the email {string}') do |nickname, email|
  OmniAuth.config.add_mock(:github, { uid: '12345', info: { nickname: nickname, email: email } })
end

When(/^I am signed in(?: as "([^\"]*)")?$/) do |nickname|
  step(%(I go to the homepage))
  step(%(I am signed in on Github with the nickname "#{nickname || 'thomas'}" and the email "thomas@example.com"))
  step(%(I follow "Sign in"))
end

When(/^I am signed in as admin$/) do
  FactoryBot.create(:user, uid: '12345', admin: true)
  step('I am signed in')
end
