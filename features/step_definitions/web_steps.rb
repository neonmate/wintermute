Then('I should see the image {string} with the alternative text {string}') do |filename, alternative_text|
  expect(page).to have_selector(:xpath, %(//img[@alt="#{alternative_text}" and contains(@src, "#{filename}")]))
end
