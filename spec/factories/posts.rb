require 'ffaker'

FactoryBot.define do
  factory :post do
    title { FFaker::Movie.title }
    description  { FFaker::Lorem.phrase }
    category { Post::CATEGORIES.sample.to_s }
    association :author
    content { FFaker::HTMLIpsum.body }

    trait :with_comments do
      comments { build_list(:comment, 3) }
    end
  end
end
