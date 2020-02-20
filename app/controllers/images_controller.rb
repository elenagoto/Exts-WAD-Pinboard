class ImagesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
  end
end
