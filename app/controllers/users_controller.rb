class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by(user_params)
    session[:user_id] = @user.id
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
