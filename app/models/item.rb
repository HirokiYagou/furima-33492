class Item < ApplicationRecord
  # バリデーション
  with_options presence: true do
    validates :name
    validates :explanation
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :cost_id
      validates :area_id
      validates :day_id
    end
    validates :price, numericality: {
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9999999,
      message: 'には半角で300~9,999,999の値を入力してください'
    }
    validates :images
  end

  # アソシエーション
  belongs_to :user
  has_one :order
  has_many_attached :images

  # インスタンス生成関数
  def self.getIndex()
    @items = []
    if Item.all != []
      10.times do |i|
        if Item.where(category_id: i + 2)
          items = Item.includes(:user).order('created_at DESC').where(category_id: i + 2)[0..4]
          @items << items
        else
          @items << []
        end
      end
    end
    return @items
  end

  def self.search(search)
    if search != ""
      Item.where('explanation LIKE(?)', "%#{search}%").order('created_at DESC')
    end
  end

  # アクティブハッシュ読み込み
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :area
  belongs_to :day
end
