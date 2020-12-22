class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end  

  def create
    @order = Order.new(order_params)
    if @order.valid?
      item_pay
      @order.save
      return redirect_to root_path
    else
      render 'index'  
    end  
  end  

  private 
  def order_params
    params.require(:order).permit().merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end  

  def item_pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end  
end
