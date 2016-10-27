FactoryGirl.define do
  factory :product do
    name Faker::Name.name
    price Faker::Number.positive
    status Faker::Boolean.boolean
    discount Faker::Number.positive
    image Faker::Lorem.sentences
    description Faker::Lorem.sentences
    rate Faker::Number.decimal(1,3)
  end
end
