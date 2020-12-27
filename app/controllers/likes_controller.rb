class LikesController < ApplicationController
  before_action :authenticate_user!

  def create 
    @like = Like.new(user_id: current_user.id, item_id: params[:item_id])
    respond_to do |format|
      if @like.save
        @item = Item.find(params[:item_id])
        format.js
      end
    end    
  end
  
  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
    @like.destroy
    @like = Like.new
    @item = Item.find(params[:item_id])
    respond_to do |format|
      format.js
    end  
  end  
end
