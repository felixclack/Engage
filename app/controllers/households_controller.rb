class HouseholdsController < ApplicationController
  
  before_filter :authenticate
  before_filter :load_household, :only => [:show, :destroy]
  
  def index
    @households = current_account.households.paginate(:page => params[:page])
  end
  
  def show
  end
  
  def destroy
    @household.destroy
    redirect_to households_url
  end
  
  private
    def load_household
      @household = current_account.households.find(params[:id])
    end
end