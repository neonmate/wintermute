FactoryBot.define do

  factory :message do
    body { 'Some body' }
    for_idea

    trait(:for_idea) do
      association(:parent, factory: :idea)
    end

    trait(:for_repository) do
      association(:parent, factory: :repository)
    end

    user
  end

end
