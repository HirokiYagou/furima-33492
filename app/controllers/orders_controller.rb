class OrdersController < ApplicationController
  def index
    @order_shipping = OrderShipping.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params(@item))
    if @order_shipping.valid?
      pay_item(@item)
      @order_shipping.save
      return redirect_to root_path
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

  def pay_item(item)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: item.price,
        card: order_params(item)[:token],
        currency: 'jpy'
      )
  end
end
