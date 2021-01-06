class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
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
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
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
      :day_id,
      :price,
      images: []
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    if current_user.id != @item.user.id || @item.order
      redirect_to root_path
    end
  end
end
