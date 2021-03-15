class GroupsController < ApplicationController
  def index
    @groups = Group.all.alphabetical_order
  end

  def show
    @group = Group.find(params[:id])
    @inversions = Inversion.joins(:group_inversions).where('group_inversions.group_id' => params[:id])
  end

  def new
    @icons = icons
  end

  def create
    @group = Group.new(name: params[:group][:name], icon: params[:group][:icon], user_id: session[:user_id])
    if @group.save
      flash[:success] = 'Group created succesfully!'
      redirect_to groups_path
    else
      flash[:danger] = 'Group was not created, please try again :c'
      redirect_to new_group_url
    end
  end
end
