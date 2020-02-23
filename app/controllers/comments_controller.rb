class CommentsController < ApplicationController
  def create
    user = User.find(session[:user_id])
    pin = Pin.find(params[:pin_id])
    comment = Comment.new(comment_params)
    comment.user = user
    comment.pin = pin
    comment.save!
    redirect_to pin_path(pin)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end

end
