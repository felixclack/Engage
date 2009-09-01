require 'test_helper'

class DashboardsControllerTest < ActionController::TestCase
  
  def setup
    @user = Factory(:user)
    @account = @user.account
  end
  
  context "signed in" do
    setup do
      @user.confirm_email! unless @user.email_confirmed?
      sign_in_as @user
    end
        
    context "GET :show" do
      setup do
        get :show
      end
      
      should_render_template :show
    end
    
  end
  
end
