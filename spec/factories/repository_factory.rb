FactoryBot.define do

  factory :repository do
    owner { 'github' }
    sequence(:name) { |n| "repository_#{n}" }

    user
  end

end
