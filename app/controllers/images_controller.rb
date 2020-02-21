class ImagesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.find(session[:user_id])
    @pin = Pin.find(params[:pin_id])
    @user.images << @pin
    redirect_back(fallback_location: root_path)
  end
end
