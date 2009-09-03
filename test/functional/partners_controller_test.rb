require 'test_helper'

class PartnersControllerTest < ActionController::TestCase
  
  def setup
    @user = Factory(:user)
    @account = @user.account
  end
  
  context "as a signed in user" do
    setup do
      @user.confirm_email!
      sign_in_as @user
    end
    
    should_be_signed_in_as { @user }
  
    context "GET :new" do
      setup do
        get :new
      end

      should_render_template :new
      should_render_a_form
      should_assign_to :partner, :class => Partner
      
      should "assign partner to account" do
        assert_equal @account, assigns(:partner).account
      end
      
    end
    
    context "POST :create" do
      setup do
        post :create, :partner => Factory.attributes_for(:partner)
      end

      should_redirect_to("show partner") { "/partners/#{assigns(:partner).id}" }
      should_be_signed_in_as { @user }
      should_change("the partner count", :by => 1) { Partner.count }
      
    end
    
    context "POST :create with invalid attributes" do
      setup do
        post :create
      end

      should_render_template :new
      should_set_the_flash_to /something went wrong/i
      
      should "show errors" do
        assert_not_nil assigns(:partner).errors
      end
      
    end
    
    context "GET :index" do
      setup do
        @partner = Factory(:partner, :account => @account, :creator => @user)
        get :index
      end

      should_render_template :index
      should_assign_to(:partners) { [@partner] }
    end
    
    context "GET :show" do
      setup do
        @partner = Factory(:partner, :account => @account, :creator => @user)
        get :show, :id => @partner.id
      end

      should_render_template :show
      should_assign_to(:partner) { @partner }
    end
    
    context "GET :edit" do
      setup do
        @partner = Factory(:partner, :account => @account, :creator => @user)
        get :edit, :id => @partner.id
      end

      should_render_template :edit
      should_assign_to(:partner) { @partner }
    end
    
  end

end
