class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.where()
  end

  def new
    @icons = icons
  end

  def create
    @group = Group.new(name: params[:group][:name], icon: params[:group][:icon], user_id: session[:user_id])
    if @group.save
      flash[:success] = "Group created succesfully!"
      redirect_to groups_path
    else
      flash[:danger] = "Group was not created, please try again :c"
      redirect_to new_group_url
    end
  end

  def edit; end

  def update; end
end
