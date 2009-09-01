class PartnersController < ApplicationController
  
  before_filter :authenticate
  
  def index
    @partners = current_account.partners
  end
  
  def new
    @partner = current_account.partners.build
  end
  
  def create
    @partner = current_account.partners.build(params[:partner])
    
    if @partner.invalid?
      flash[:error] = 'Something went wrong'
      render :new and return
    end
    
    @partner.save!
    
    redirect_to @partner
  end
  
end
