class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
  end  

  def new 
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else 
      render 'new'
    end    
  end  

  def edit 
    @item = Item.find(params[:id])
  end
  
  def update
  end  

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :category_id, :state_id, :shipping_fee_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
