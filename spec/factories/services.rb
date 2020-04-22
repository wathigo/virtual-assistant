FactoryBot.define do
  factory :service do
    name { Faker::Name.name }
    association :category
  end
end
