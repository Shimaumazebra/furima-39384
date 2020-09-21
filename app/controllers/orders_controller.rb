class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
      else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:item_id, :token, :post_code, :prefecture_id, :address, :city, :building_name, :phone_num).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_89bab59f6a5a1e0a15756658" 
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token], 
      currency:'jpy' 
    )
  end

end
