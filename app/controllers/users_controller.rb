class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:username] = @user.username
      redirect_to user_path(@user), notice: 'Your account has been created'
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
