require 'faker'
FactoryBot.define do
  factory :feed do
    title { Faker::Name.first_name }
    source { create(:source) }
  end
end
