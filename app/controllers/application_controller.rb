class ApplicationController < ActionController::Base
    def current_user
        if session[:username]
          @current_user ||= User.find_by(username: session[:username])
        else
          @current_user = nil
        end
      end
end
