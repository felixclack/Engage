class PagesController < ApplicationController
  
  layout 'signin'
  
  def show
    render params[:id]
  end
  
  
  
end
