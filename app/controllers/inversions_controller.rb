class InversionsController < ApplicationController
  include SessionsHelper
  def index
    @inversions = Inversion.where(author_id: current_user)
    @total = Inversion.total(current_user)
  end

  def external
    @inversions = Inversion.externals(current_user)
  end

  def new
    @groups = Group.select_options
  end

  def create
    @amount = params[:investment][:amount].to_f.round(2)

    # @inversion = Inversion.new(name: params[:investment][:name], amount: @amount)
    @inversion = Inversion.new(inversion_params)
    @inversion.author_id = session[:user_id]

    if @inversion.save
      @group = params[:investment][:group]
      if @group != 0
        @relation = GroupInversion.new(group_id: @group, inversion_id: @inversion.id)
        @relation.save
      end
      flash[:success] = 'Inversion created succesfully!'
    else
      flash[:danger] = 'Inversion was not created, please try again :c'
    end
    redirect_to inversions_path
  end

  private

  def inversion_params
    params.require(:investment).permit(:name, :amount.to_f.round(2))
  end
end
