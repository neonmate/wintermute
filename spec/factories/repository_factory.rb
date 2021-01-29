FactoryBot.define do

  factory :repository do
    owner { 'github' }
    sequence(:name) { |n| "repository_#{n}" }

    user

    trait(:archived) do
      archived_at { Time.now }
    end
  end

end
