class SessionsController < ApplicationController
  before_action :require_login

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

  def index
    if params[:type] == "mysessions"
      @sessions = current_user.my_sessions
      @total = current_user.my_sessions_total
      @title = "My Study Sessions"
    elsif params[:type] == "external"
      @sessions = current_user.ext_sessions
      @total = current_user.ext_sessions_total
      @title = "External Study Sessions"
    end
  end

  def session_params
    params.require(:session).permit(:name, :amount)
  end
end
