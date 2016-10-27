FactoryGirl.define do
  factory :order_detail do
    quantity {Faker::Number.digit}
    price {Faker::Number.positive}
    status {Faker::Boolean.boolean}
    product
  end
end
