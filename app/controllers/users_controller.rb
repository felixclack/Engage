class UsersController < ApplicationController
  
  before_filter :authenticate
  before_filter :load_user, :only => [:show, :edit, :update]
  
  def index
    @users = current_account.users.paginate(:page => params[:page])
  end

  def new
    if params[:account_id]
      @account = Account.find(params[:account_id])
      @user = @account.users.build
    else
      @user = User.new
    end
  end
  
  def create
    @user = current_account.users.build(params[:user])
    
    if @user.invalid?
      flash[:error] = "Something went wrong"
      render :new and return
    end
    
    @user.save!
    redirect_to users_url
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @user.attributes = params[:user]
    
    if @user.invalid?
      flash[:error] = "There was a problem"
      render :edit and return
    end
    
    @user.save!
    redirect_to @user
  end
  
  private
    def load_user
      @user = current_account.users.find(params[:id])
    end
  
end