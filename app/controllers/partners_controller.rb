class PartnersController < ApplicationController
  
  before_filter :authenticate
  before_filter :load_partner, :only => [:show, :edit, :update]
  
  def index
    @partners = current_account.partners.paginate(:page => params[:page])
  end
  
  def new
    @partner = current_account.partners.build
  end
  
  def create
    @partner = current_account.partners.build(params[:partner])
    
    @partner.creator = current_user
    
    if @partner.invalid?
      flash[:error] = 'Something went wrong'
      render :new and return
    end
    
    @partner.save!
    
    redirect_to @partner
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    @partner.attributes = params[:partner]
    
    if @partner.invalid?
      flash[:error] = 'There was an error'
      render :edit and return
    end
    
    @partner.save!
    redirect_to @partner
  end
  
  protected
    def load_partner
      @partner = current_account.partners.find(params[:id])
    end
  
end
