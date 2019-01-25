RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:deletion)
  end

  config.around do |example|
    DatabaseCleaner.strategy = if example.metadata[:transaction] == false
      :deletion
    elsif example.metadata[:js] == true
      :deletion
    else
      :transaction
    end

    DatabaseCleaner.start
    example.run
    DatabaseCleaner.clean
  end
end
