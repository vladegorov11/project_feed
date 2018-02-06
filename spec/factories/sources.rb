require 'faker'
FactoryBot.define do
  factory :source do
    name { Faker::Name.first_name }
    api_url "asdasfafa"
    description_url "sadasf"
  end
end
