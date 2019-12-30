FactoryBot.define do

  factory :idea do
    title { 'Some title' }
    description { 'Some description' }
    body { 'Some body' }

    user
  end

end
