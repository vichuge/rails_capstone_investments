class GroupsController < ApplicationController
  def index
    @groups = Group.all.alphabetical_order
  end

  def show
    @group = Group.find(params[:id])
    @inversions = Inversion.in_a_group(params[:id])
  end

  def new
    @icons = icons
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = session[:user_id]
    if @group.save
      flash[:success] = 'Group created succesfully!'
      redirect_to groups_path
    else
      flash[:danger] = 'Group was not created, please try again :c'
      redirect_to new_group_url
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
