class DropUser < ActiveRecord::Migration[6.0]
  def change
    drop_table :item_categories
    drop_table :item_category_rels
    drop_table :categories
  end
end
