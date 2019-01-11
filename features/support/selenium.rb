Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--mute-audio')
  options.add_argument('--disable-infobars')
  options.add_argument('--headless') unless ENV['CHROME_HEADLESS']
  options.add_argument('--disable-gpu')
  options.add_preference('credentials_enable_service', false)
  options.add_preference('profile.password_manager_enabled', false)

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :selenium_chrome_headless
