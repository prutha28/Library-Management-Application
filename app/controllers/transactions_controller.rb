class TransactionsController < ApplicationController
  before_action :confirm_logged_in

  def show
    @transactions = Transaction.fetch(params[:isbn])
    render('transactions/index')
  end


end
