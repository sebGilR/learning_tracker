class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
      if session[:username]
        return @current_user ||= User.find_by(username: session[:username])
      else
        return @current_user = nil
      end
    end

    private
 
    def require_login
      unless current_user
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_url
      end
    end
end
