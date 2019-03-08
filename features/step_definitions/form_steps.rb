Then('I should see a success flash {string}') do |string|
  step %(I should see "#{string}" within the alert success)
end

Then('I should see an error flash {string}') do |string|
  step %(I should see "#{string}" within the alert danger)
end

Then(/I should( not)? see a button with the label "([^\"]*)"$/) do |negate, label|
  expect_css(negate, '.btn', label)
end
