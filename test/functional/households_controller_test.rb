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

      should_destroy :household
      should_redirect_to("households index") { "/households" }
    end
    
    context "on GET :new" do
      setup do
        get :new
      end

      should_render_template :new
      should_assign_to :household, :class => Household
    end
    
    context "on POST :create" do
      setup do
        post :create, :household => {:address => "22 Youens Crescent, Newton Aycliffe, DL5 4ZE"}
      end
      
      should_create :household
      should_redirect_to("show household") { "/households/#{assigns(:household).to_param}" }
    end
    
    
    
  end
  

end
