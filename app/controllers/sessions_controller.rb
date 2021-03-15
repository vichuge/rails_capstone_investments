class SessionsController < ApplicationController
  include SessionsHelper
  before_action :logged_user?, only: [:new]

  def create
    @user = User.find_by(username: params[:session][:username])

    if @user
      session[:user_id] = @user.id
      session[:username] = @user.username
      flash[:success] = "Welcome #{@user.username}"
      redirect_to user_path(@user)
    else
      flash[:danger] = 'Wrong login info'
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    flash[:success] = 'Log out successfully'
    redirect_to root_path
  end
end
