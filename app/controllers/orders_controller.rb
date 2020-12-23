class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :forbit_item_buyer

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
      @item = Item.find(params[:item_id])
      render 'index'  
    end  
  end  

  private 
  def order_address_params
    params.require(:order_address).permit(:postal_code, :phone_number, :prefecture_id, :city, :address, :building).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
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

  def forbit_item_buyer
    item = Item.find(params[:item_id])
    if item.user.id == current_user.id
      redirect_to root_path
    end   
  end  
end
