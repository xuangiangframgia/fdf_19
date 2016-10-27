FactoryGirl.define do
  factory :suggest do
    name  {Faker::Name.name}
    body  {Faker::Lorem.paragraph}
    image  {Faker::Avatar.image}
    price  {Faker::Number.decimal(2)}
    status  {Faker::Boolean.boolean}
    user
  end
end
