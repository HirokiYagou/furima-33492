class CategoriesController < ApplicationController
  def show
    @items = Item.includes(:user).order('created_at DESC').where(category_id: params[:id])
  end
end
