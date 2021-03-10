class TransactionsController < ApplicationController
  include SessionsHelper
  def index
    @transactions = Transaction.where(author_id: current_user)
    @total = @transactions.sum('amount')
  end

  def external
    @transactions = Transaction.where(author_id: current_user)
    @total = @transactions.sum('amount')
  end

  def new; end

  def create; end

  def edit; end

  def update; end
end
