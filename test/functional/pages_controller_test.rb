require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  
  context "when not signed in" do  
    setup do
      sign_out
    end
    
    context "GET /" do
      setup do
        get :show, :id => 'home'
      end

      should_render_template :home
      should_render_a_form
      
    end
  end
  
end
