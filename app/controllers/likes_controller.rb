class LikesController < ApplicationController
  before_action :authenticate_user!

  def create 
    @like = Like.build(user_id: current_user.id, item_id: params[:item_id])
    respond_to do |format|
      if @like.save
        format.js 
      end
    end    
  end
  
  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
    @like.destroy
    @like = Like.new
    respond_to do |format|
      format.js
    end  
  end  
end
