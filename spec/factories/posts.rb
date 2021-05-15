require 'ffaker'

FactoryBot.define do
  factory :post do
    title { FFaker::Movie.title }
    description  { FFaker::Lorem.phrase }
    category { Post::CATEGORIES.sample.to_s }
    author { create(:author) }
    content { FFaker::HTMLIpsum.body }
  end
end
