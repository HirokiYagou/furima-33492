class OrderShipping
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post, :area_id, :city, :address, :building, :tel, :token

  with_options presence: true do
    validates :post, format: {
      with: /\A\d{3}[-]\d{4}\z/.freeze,
      message: 'ハイフンをつけて数字7文字で入力してください'}
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :tel, format: {
      with: /\A0\d{9,10}\z/.freeze,
      message: 'はハイフンは不要で0から始まる10桁または11桁の半角数字で入力してください'
    }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(post: @post, area_id: area_id, city: city, address: address, tel: tel, order_id: order.id)
  end
end