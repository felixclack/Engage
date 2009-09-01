require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @user = Factory(:user)
    @account = @user.account
  end
  
  context "a signed in user" do
    setup do
      sign_in_as @user
    end
  
    context "on GET :new" do
      setup do
        get :new
      end

      should_render_template :new
      should_assign_to :user, :class => User
    end
  
    context "on GET :new with :account_id" do
      setup do
        get :new, :account_id => @account.id
      end

      should_render_template :new
      should_assign_to :user, :class => User
      should "assign user to account" do
        assert_equal @account, assigns(:user).account
      end
    end
  
    context "on POST :create with :account_id" do
      setup do
        post :create, :user => Factory.attributes_for(:another_user), :account_id => @account.id
      end
    
      should_change("the user count", :by => 1) { User.count }
      should_redirect_to("dashboard") { '/dashboard' }
    end
    
  end
  
end