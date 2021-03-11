class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(session[:user_id])
  end

  def new; end

  def create
    @user = User.new(username: params[:user][:username])
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

  def edit; end

  def update; end
end
