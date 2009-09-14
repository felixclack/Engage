require File.dirname(__FILE__) + '/../test_helper'

class NotesControllerTest < ActionController::TestCase

  def setup
    @account = Factory(:account)
    @user = Factory(:user, :account => @account)
    @partner = Factory(:partner, :creator => @user, :account => @account)
    @note = Factory(:note, :partner => @partner, :creator => @user)
  end
  
  context "as a signed in user" do
    setup do
      @user.confirm_email!
      sign_in_as @user
    end
    
    should_be_signed_in_as { @user }
    
    context "on POST :create" do
      setup do
        post :create, :partner_id => @partner.to_param, :note => {:body => "A note"}
      end

      should_change('note count', :by => 1) { Note.count }
    end
  
  end
  
end
