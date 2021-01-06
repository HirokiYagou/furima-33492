FactoryBot.define do
  factory :item do
    name         { Faker::Space.planet }
    explanation  { Faker::Lorem.sentence }
    category_id  { rand(2..11) }
    condition_id { rand(2..7) }
    cost_id      { rand(2..3) }
    area_id      { rand(2..48) }
    day_id      { rand(2..4) }
    price        { rand(300..9999999) }
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
