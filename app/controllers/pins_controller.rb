class PinsController < ApplicationController
  def index
  end

  def new
    @user = User.find(session[:user_id])
    @pin = Pin.new
  end

  def create
    user = User.find(session[:user_id])
    @pin = Pin.new(pin_params)
    @pin.user = user

    if @pin.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :image_url, :tag)
  end
end
