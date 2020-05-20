class LoginsController < ApplicationController
  before_action :already_logged, except: [:destroy]

  def new; end

  def create
    user = User.find_by(username: params[:username])

    if user.nil?
      flash.now[:notice] = 'Username is not valid'
      render :new
    else
      session[:username] = user.username
      redirect_to user_url(user), notice: 'Logged in!'
    end
  end

  def destroy
    session[:username] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
