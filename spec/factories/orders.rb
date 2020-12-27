FactoryBot.define do
  factory :order do
    association :item
    association :user
  end
end
