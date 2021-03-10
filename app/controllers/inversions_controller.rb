class InversionsController < ApplicationController
  include SessionsHelper
  def index
    @transactions = Inversion.where(author_id: current_user)
    @total = @transactions.sum('amount')
  end

  def external
    @transactions = Inversion.where(author_id: current_user)
    @total = @transactions.sum('amount')
  end

  def new
    @groups = Group.all
  end

  def create; end

  def edit; end

  def update; end
end
