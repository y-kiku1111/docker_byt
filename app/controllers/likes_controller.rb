class LikesController < ApplicationController
  before_action :catch_copy_params

  def create
    Like.create(user_id: current_user.id, catch_copy_id: params[:id])
    # redirect_to catch_copies_path
  end
  
  def destroy
    Like.find_by(user_id: current_user.id, catch_copy_id: params[:id]).destroy
    # redirect_to catch_copies_path
  end

  private

  def catch_copy_params
    @catch_copy = CatchCopy.find(params[:id])
  end

end

