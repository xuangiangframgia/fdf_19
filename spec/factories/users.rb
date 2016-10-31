FactoryGirl.define do
  factory :user do
    name  {Faker::Name.name}
    email  {Faker::Internet.email}
    address  {Faker::Address.street_address}
    password {"123456"}
    password_confirmation {"123456"}
    phone {"123456789"}
  end
end
