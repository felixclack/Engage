require File.dirname(__FILE__) + '/../test_helper'

class HouseholdsControllerTest < ActionController::TestCase

  def setup
    @user = Factory(:user)
    @account = @user.account
    @household = Factory(:household, :account => @account)
  end
  
  context "as a signed in user" do
    setup do
      @user.confirm_email!
      sign_in_as @user
    end
    
    should_be_signed_in_as { @user }
    
    context "on GET :index" do
      setup do
        get :index
      end

      should_render_template :index
      should_assign_to(:households) { [@household] }
    end
    
    context "on GET :show" do
      setup do
        get :show, :id => @household.to_param
      end

      should_render_template :show
      should_assign_to(:household) { @household }
    end
    
    context "on DELETE :destroy" do
      setup do
        delete :destroy, :id => @household.to_param
      end

      should_change("the number of households", :by => -1) { Household.count }
      should_redirect_to("households index") { "/households" }
    end
    
    
    
  end
  

end
