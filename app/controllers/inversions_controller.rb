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
    @groups = Group.all.map { |g| [g.name, g.id] }
  end

  def create; end

  def edit; end

  def update; end
end
