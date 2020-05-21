class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:username]
      @current_user ||= User.find_by(username: session[:username])
    else
      @current_user = nil
    end
  end

  private

  def require_login
    return if current_user
    
    redirect_to root_url
  end

  def already_logged
    redirect_to user_url(current_user) if current_user
  end
end
