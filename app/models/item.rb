class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :cost_id
    validates :area_id
    validates :days_id
    validates :price
  end

  belongs_to :user
end
