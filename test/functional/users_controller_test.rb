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
        assigns(:user).account.should == @account
      end
    end
  
    context "on POST :create with :account_id" do
      setup do
        post :create, :user => Factory.attributes_for(:another_user), :account_id => @account.id
      end
    
      should_change("the user count", :by => 1) { User.count }
      should_redirect_to("dashboard") { '/dashboard' }
    end
    
    context "on GET :index" do
      setup do
        get :index
      end

      should_render_template :index
      should_assign_to(:users) { [@user] }
    end
    
    context "on GET :show" do
      setup do
        get :show, :id => @user.to_param
      end

      should_render_template :show
      should_assign_to :user, :class => User
    end
    
    context "on GET :edit" do
      setup do
        get :edit, :id => @user.to_param
      end

      should_render_template :edit
      should_assign_to :user, :class => User
    end
    
    context "on PUT :update" do
      setup do
        put :update, :id => @user.to_param, :user => {:full_name => "Awesome dude"}
      end

      should "change name" do
        assigns(:user).full_name.should == 'Awesome Dude'
      end
      should_redirect_to("user url") { user_url(@user) }
    end
    
    
    
  end
  
end