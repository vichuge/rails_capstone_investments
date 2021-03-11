class InversionsController < ApplicationController
  include SessionsHelper
  def index
    @inversions = Inversion.where(author_id: current_user)
    @total = Inversion.where(author_id: current_user).sum('amount')
  end

  def external
    @inversions = Inversion.left_joins(:group_inversions).where('group_inversions is null').where(author_id: current_user)
  end

  def new
    @groups = Group.all.map { |g| [g.name, g.id] }
    @groups.unshift(["select and option...", 0])
  end

  def create
    @inversion = Inversion.new(name: params[:investment][:name], amount: params[:investment][:amount])
    @inversion.author_id = session[:user_id]
    
    if @inversion.save
      @group = params[:investment][:group]
      if @group != 0
        @relation = GroupInversion.new(group_id: @group, inversion_id: @inversion.id)
        @relation.save
      end
      flash[:success] = 'Inversion created succesfully!'
      redirect_to inversions_path
    else
      flash[:danger] = 'Inversion was not created, please try again :c'
      redirect_to inversions_path
    end
  end

  def edit; end

  def update; end
end
