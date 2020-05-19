class SessionsController < ApplicationController
  before_action :require_login

  def new
    @group_options = Group.all.map { |g| [g.name, g.name] }
    @group_options.unshift([nil, nil])
    @session = current_user.sessions.build
  end

  def create
    @session = current_user.sessions.build(session_params)
    @session.group = params[:group]
    
    if @session.save
        redirect_to sessions_path, notice: "Session saved"
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
    else
      redirect_to user_url(current_user)
    end
  end

  def session_params
    params.require(:session).permit(:name, :amount, :group)
  end
end
