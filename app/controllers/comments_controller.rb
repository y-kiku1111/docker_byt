class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/catch_copies/#{comment.catch_copy.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, catch_copy_id: params[:catch_copy_id])
  end
end
