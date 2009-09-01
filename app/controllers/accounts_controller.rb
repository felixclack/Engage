class AccountsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(params[:account])

    if @account.invalid?
      flash[:error] = "Something went wrong"
      render :new and return
    end
    
    flash[:notice] = 'Account was successfully created.'
    redirect_to new_account_user_url(@account)
  end

end
