class GroupsController < ApplicationController
  before_action :require_login
  
  def index
    @groups = Group.all
  end

  def show
    @group = Group.includes(sessions: [:author]).find_by(name: params[:name])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to group_path(@group), notice: "Group created"
    else
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
