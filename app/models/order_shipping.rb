class OrderShipping
  include ActiveModel::Model
  attr_accessor :itme, :user, :post, :area_id, :city, :address, :building, :tel

  with_options presence: true do
    validates :post
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :tel, format: { with: /\A0\d{9,10}\z/.freeze, message: 'は0から始まる10桁または11桁の半角数字で入力してください' }
  end

  def save
    order = Order.create(item_id: item.id, user_id: user.id)
    Shipping.create(post: post, area_id: area_id, city: city, address: address, tel: tel)
  end
end