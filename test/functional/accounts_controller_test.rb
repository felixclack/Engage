require File.dirname(__FILE__) + '/../test_helper'

class AccountsControllerTest < ActionController::TestCase

  def setup
    @account = Factory(:account)
  end
  
  context "GET :new" do
    setup do
      get :new
    end

    should_render_template :new
    should_render_a_form
    should_assign_to :account, :class => Account
  end
  
  context "POST :create" do
    setup do
      post :create, :account => {:name => "New Account"}
    end

    should_assign_to :account, :class => Account
    should_redirect_to("new user") { new_account_user_url(assigns(:account)) }
  end
  
  context "POST :create with invalid attributes" do
    setup do
      post :create
    end

    should_render_template :new
    should_set_the_flash_to /something went wrong/i
  end
  
  
  

end
