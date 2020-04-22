FactoryBot.define do
  factory :service_mapper do
    association :employee, factory: :user
    association :client, factory: :user
    association :service
  end
end
