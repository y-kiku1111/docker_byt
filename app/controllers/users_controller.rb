class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @catch_copy = current_user.catch_copys
    @catch_copy = current_user.catch_copys.page(params[:page]).per(5).order("created_at DESC")
  end
end
