class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params(@item))
    if @order_shipping.valid?
      pay_item(@item)
      @order_shipping.save
      return redirect_to root_path
    else
      render :index
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
    Payjp.api_key = Rails.application.credentials.PAYJP[:PAYJP_SECRET_KEY]
      Payjp::Charge.create(
        amount: item.price,
        card: order_params(item)[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @item.order || current_user.id == @item.user.id
      redirect_to root_path
    end
  end
end
