class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :forbit_correct_user, only: [:edit, :update] 

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
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit'
    end    
  end  

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :category_id, :state_id, :shipping_fee_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  def forbit_correct_user
    item = Item.find(params[:id])
    if item.user.id != current_user.id
      redirect_to root_path
    end
  end  
end
