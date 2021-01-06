30.times do
  item = Item.new(
    name: Faker::Movies::StarWars.character,
    explanation: Faker::Movies::StarWars.quote,
    category_id: rand(2..11),
    condition_id: rand(2..7),
    cost_id: rand(2..3),
    area_id: rand(2..48),
    day_id: rand(2..4),
    price: rand(300..9999999),
    user_id: rand(1..3),
  )
  i = rand(1..3)
  images = []
  i.times do
    icon_num = rand(1..27)
    item.images.attach(io: File.open("#{Rails.root}/public/images/icon#{icon_num}.png"), filename: "icon#{icon_num}.png")
  end
  item.save
end