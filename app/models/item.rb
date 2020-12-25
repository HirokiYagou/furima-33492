class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :explanation
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :cost_id
      validates :area_id
      validates :days_id
    end
    validates :price
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost
  belongs_to :area
  belongs_to :day
end
