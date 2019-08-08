FactoryBot.define do

  factory :message do
    body { 'Some body' }

    conversation
    user
  end

end
