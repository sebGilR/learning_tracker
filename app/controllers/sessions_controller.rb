class SessionsController < ApplicationController
  before_action :require_login

  def new
    groups_list
    @session = current_user.sessions.build
  end

  def create
    @session = current_user.sessions.build(session_params)
    @session.group = params[:group]

    if @session.save
      redirect_to sessions_path
    else
      groups_clean
      render :new
    end
  end

  def index
    if params[:type] == 'mysessions'
      @sessions = current_user.my_sessions
      @total = current_user.my_sessions_total
      @title = 'My Study Sessions'
    elsif params[:type] == 'external'
      @sessions = current_user.ext_sessions
      @total = current_user.ext_sessions_total
      @title = 'External Study Sessions'
    elsif params[:type] == 'recent'
      @sessions = current_user.recent
      @total = current_user.recent_total
      @title = 'Last 5 Sessions'
    else
      redirect_to user_url(current_user)
    end
  end

  private

  def groups_list
    @group_options = Group.all.map { |g| [g.name, g.name] }
    @group_options.unshift(['Select a group', nil])
  end

  def groups_clean
    @group_options = Group.all.map { |g| [g.name, g.name] }
  end

  def session_params
    params.require(:session).permit(:name, :amount, :group)
  end
end
