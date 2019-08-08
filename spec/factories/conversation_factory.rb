FactoryBot.define do

  factory :conversation do
    title { 'Some title' }
    body { 'Some body' }

    user
  end

end
