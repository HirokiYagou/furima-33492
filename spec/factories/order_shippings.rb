FactoryBot.define do
  factory :order_shipping do
    post { '111-1111' }
    area_id      { rand(2..48) }
    city { Gimei.city.kanji }
    address { Gimei.town.kanji }
    tel { Faker::Number.leading_zero_number(digits: 10) }
    item_id { 1 }
    user_id { 1 }
  end
end