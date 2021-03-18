# Spreewald overrides

Then /^the "([^"]*)" field should( not)? have an error$/ do |label, negate|
  patiently do
    expectation = negate ? :should_not : :should
    field = find_field(label)
    field[:id].should be_present # prevent bad CSS selector if field lacks id
    page.send(expectation, have_css(".is-invalid##{field[:id]}"))
  end
end
