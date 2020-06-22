class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @catch_copy = current_user.catch_copies
    @catch_copies = current_user.catch_copies.order("created_at DESC").page(params[:page]).per(3)
  end
end
