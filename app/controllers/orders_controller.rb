class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :forbit_item_buyer
  before_action :forbit_buyed_item
  

  def index
    @order_address = OrderAddress.new
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
    params.require(:order_address).permit(:postal_code, :phone_number, :prefecture_id, :city, :address, :building).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end  

  def item_pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end  

  def forbit_item_buyer
    if @item.user.id == current_user.id
      redirect_to root_path
    end   
  end  

  def forbit_buyed_item
    if @item.order
      redirect_to root_path
    end  
  end  

  def set_item
    @item = Item.find(params[:item_id])
  end  
end
