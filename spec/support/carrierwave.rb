RSpec.configure do |c|
  c.include CarrierWave::Test::Matchers, type: :uploader
end
