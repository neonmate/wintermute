require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<GITHUB_PERSONAL_ACCESS_TOKEN>') do
    Rails.application.secrets.github_personal_access_token
  end
end
