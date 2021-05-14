FactoryBot.define do
  factory :author do
    name { FFaker::Name.name }

    trait :with_posts do
      posts { build_list(:post, 3) }
    end
  end
end
