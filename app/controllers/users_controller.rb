class UsersController < ApplicationController
  
  before_filter :authenticate

  def new
    if params[:account_id]
      @account = Account.find(params[:account_id])
      @user = @account.users.build
    else
      @user = User.new
    end
  end
  
  def create
    if params[:account_id]
      @account = Account.find(params[:account_id])
      @user = @account.users.build(params[:user])
    else
      @user = User.new(params[:user])
    end
    
    if @user.invalid?
      flash[:error] = "Something went wrong"
      render :new and return
    end
    
    @user.save!
    redirect_to dashboard_url
  end
  
end