class NotesController < ApplicationController
  
  before_filter :authenticate
  
  def create
    @partner = current_account.partners.find(params[:partner_id])
    @note = @partner.notes.build(params[:note])
    
    @note.creator = current_user

    if @note.invalid?
      render :new and return
    end
    
    @note.save!
    redirect_to partner_url(@partner)
  end
  
end