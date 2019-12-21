FactoryBot.define do

  factory :idea do
    title { 'Some title' }
    body { 'Some body' }

    user
  end

end
