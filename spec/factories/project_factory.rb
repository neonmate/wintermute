FactoryBot.define do

  factory :project do
    title { 'Some title' }
    subtitle { 'Some subtitle' }
    description { 'Some description' }
    sequence(:repository_url) { |n| "https://github.com/github/example_#{n}" }

    user
  end

end
