FactoryBot.define do
  factory :comment do
    name { FFaker::Name.name }
    content { "MyText" }
    association :post
  end
end
