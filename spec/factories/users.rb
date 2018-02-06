require 'faker'
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    sequence(:email)  {|n| "email#{n}@gmail.com"}
    password  "password"
    password_confirmation "password"

    trait :admin do
      role "admin"
    end
  end
end
