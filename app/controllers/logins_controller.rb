class LoginsController < ApplicationController
    def new; end

    def create
        user = User.find_by(username: params[:username])

        if user.nil?
            redirect_to login_url, notice: 'Username is not valid'
        else
            session[:username] = user.username
            redirect_to root_url, notice: "Logged in!"
        end
    end

    def destroy
        session[:username] = nil
        redirect_to login_url, notice: "Logged out!"
    end
end
