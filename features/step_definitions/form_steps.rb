Then('I should see a success flash {string}') do |string|
  step %(I should see "#{string}" within the alert success)
end

Then('I should see an error flash {string}') do |string|
  step %(I should see "#{string}" within the alert danger)
end

Then(/I should( not)? see a button with the label "([^"]*)"$/) do |negate, label|
  patiently do
    expectation = negate ? :not_to : :to
    button = find_button(label)

    expect(button).send(expectation, be_present)
  end
end
