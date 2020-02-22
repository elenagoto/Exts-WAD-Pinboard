class PinsController < ApplicationController
  def index
    if session[:user_id].present?
      @user = User.find(session[:user_id])
    else
      @user = nil
    end

    @search_term = params[:q]
    logger.info("Search completed using #{@search_term}")
    @pins = Pin.search(@search_term).order(created_at: :desc)
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

  def edit
    @pin = Pin.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @pin = Pin.find(params[:id])

    if @pin.update(pin_params)
      redirect_to user_images_path(@user)
    else
      render 'edit'
    end
  end

  private

  def pin_params
    params.require(:pin).permit(:title, :image_url, :tag)
  end
end
