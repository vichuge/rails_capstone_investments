class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(session[:user_id])
  end

  def new; end

  def create; end

  def edit; end

  def update; end
end
