Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--mute-audio')
  options.add_argument('--disable-infobars')
  options.add_argument('--headless') unless ENV['CHROME_HEADLESS']
  options.add_argument('--disable-gpu')
  options.add_preference('credentials_enable_service', false)
  options.add_preference('profile.password_manager_enabled', false)
  options.add_emulation(device_metrics: { width: 1440, height: 900, touch: false })

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :selenium_chrome_headless

# https://github.com/teamcapybara/capybara/blob/84acc29d5ff807507fe57aafcf7f9b2acdb89fe2/README.md#setup
Capybara.server = :puma, { Silent: true }

# https://github.com/makandra/spreewald/tree/c4c460d329c44f47b7cacc687bcba47768349533#recommended-capybara-defaults
Capybara.default_normalize_ws = true
Capybara.match = :prefer_exact
Capybara.enable_aria_label = true
