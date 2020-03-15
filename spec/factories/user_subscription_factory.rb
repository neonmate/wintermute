FactoryBot.define do

  factory :user_subscription, class: 'User::Subscription' do
    user

    for_idea

    trait :for_idea do
      association :subscribable, factory: :idea
    end

    trait :for_repository do
      association :subscribable, factory: :repository
    end
  end

end
