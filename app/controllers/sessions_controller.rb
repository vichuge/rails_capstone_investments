class SessionsController < ApplicationController
  include SessionsHelper
  before_action :logged_user?, only: [:new]

  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])
    # @user ||= User.find(params[:session][:username].to_i)

    if @user
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'Wrong login info'
      render 'new'
    end
  end

  def destroy
    reset_session
    # session[:username] = nil
    flash[:success] = 'Log out successfully'
    redirect_to root_path
  end
end
