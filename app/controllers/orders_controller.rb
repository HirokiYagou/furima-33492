class OrdersController < ApplicationController
  def index
    @order_shipping = OrderShipping.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params(@item))
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params(item)
    params.require(:order_shipping).permit(
      :post,
      :area_id,
      :city,
      :address,
      :building,
      :tel
    ).merge(
      item_id: item.id,
      user_id: current_user.id,
      token: params[:token]
    )
  end
end
