class Item < ApplicationRecord

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

  belongs_to :user
  has_one :order
  has_many_attached :images

  def self.search(search)
    if search != ""
      Item.where('explanation LIKE(?)', "%#{search}")
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :area
  belongs_to :day
end
