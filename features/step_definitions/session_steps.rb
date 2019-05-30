Given('I am signed in on Github with the nickname {string} and the email {string}') do |nickname, email|
  OmniAuth.config.add_mock(:github, { uid: '12345', info: { nickname: nickname, email: email } })
end

When(/^I am signed in(?: as "([^\"]*)")?$/) do |nickname|
  if page.current_url.blank?
    step(%(I go to the homepage))
  end
  step(%(I am signed in on Github with the nickname "#{nickname || 'thomas'}" and the email "thomas@example.com"))
  step(%(I follow "Sign in"))
end
