FactoryBot.define do

  factory :external_repository_review do
    sequence(:identifier) { |number| "neonmate/wintermute#{number}" }
    homepage_url { 'https://wintermute.app' }

    trait(:added) do
      state { 'added' }
    end

    trait(:rejected) do
      state { 'rejected' }
    end
  end

end
