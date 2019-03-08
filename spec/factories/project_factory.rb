FactoryBot.define do

  factory :project do
    title { 'Some title' }
    subtitle { 'Some subtitle' }
    description { 'Some description' }
    repository_url { 'https://github.com/github/example' }

    user
  end

end
