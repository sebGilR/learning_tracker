class SessionsController < ApplicationController
  def new
    @session = current_user.sessions.build
  end

  def create
    @session = current_user.sessions.build(session_params)
    
    if @session.save
      redirect_to root_url, notice: "Session saved"
    else
      render :new
    end
  end

  def session_params
    params.require(:session).permit(:name, :amount)
  end
end
