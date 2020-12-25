class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private
  def item_params
    params.require(:item).permit(
      :name,
      :explanation,
      :category_id,
      :condition_id,
      :cost_id,
      :area_id,
      :days_id,
      :price
    ).merge()
  end
end