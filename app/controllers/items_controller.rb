class ItemsController < ApplicationController
  
  def index
  end

  def new 
    @item = Item.new
  end
  
  def create
 
  end  

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :state_id, :shipping_fee_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
