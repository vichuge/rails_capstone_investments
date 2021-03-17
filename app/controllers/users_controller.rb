class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:username] = @user.username
      flash[:success] = "User created, welcome #{@user.username}"
      redirect_to user_path(@user.id)
    else
      flash[:danger] = 'User was not created, please try another name :c'
      redirect_to new_user_url
    end
  end

  def new; end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
