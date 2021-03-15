FactoryBot.define do

  factory :repository do
    owner { 'github' }
    sequence(:name) { |n| "repository_#{n}" }

    user
    published

    trait(:with_preview_image) do
      preview_image { Rails.root.join('spec', 'fixtures', 'files', 'image_1.jpg').open }
    end

    trait(:archived) do
      archived_at { Time.now }
    end

    trait(:draft) do
      state { 'draft' }
    end

    trait(:published) do
      with_preview_image
      state { 'published' }
      delivery_model { 'self_hosted' }
      categories { 'hosting, managment' }
    end

    trait(:rejected) do
      state { 'rejected' }
    end
  end

end
