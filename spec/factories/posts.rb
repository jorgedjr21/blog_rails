require 'ffaker'

FactoryBot.define do
  factory :post do
    title { FFaker::Movie.title }
    category { Post::CATEGORIES.sample }
    author { create(:author) }
    content { FFaker::HTMLIpsum.body }
  end
end
