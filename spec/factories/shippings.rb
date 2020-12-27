FactoryBot.define do
  factory :shipping do
    post {  }
    area_id      { rand(2..48) }
    city { Gimei.city.kanji }
    address { Gimei.town.kanji }
    tel { Faker::Number.leading_zero_number(digits: 10) }
    association :order
  end
end
