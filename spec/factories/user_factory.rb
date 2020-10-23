FactoryBot.define do

  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    sequence(:uid)
    sequence(:nickname) { |n| "user_#{n}" }

    trait :admin do
      admin { true }
    end
  end

end
