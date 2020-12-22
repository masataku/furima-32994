class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end  

  private 
  def order_params
    params.require(:order).permit().merge(token: params[:token])
  end  
end
