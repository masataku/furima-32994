class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end  

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      item_pay
      @order_address.save
      return redirect_to root_path
    else
      render 'index'  
    end  
  end  

  private 
  def order_address_params
    params.require(:order_address).permit(:token, :postal_code, :phone_number, :prefecture_id, :city, :address, :building)
  end  

  def item_pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end  
end
