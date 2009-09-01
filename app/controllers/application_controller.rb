class ApplicationController < ActionController::Base
  include Clearance::Authentication

  helper :all

  protect_from_forgery

  include HoptoadNotifier::Catcher
  
  helper_method :current_account
  
  protected
    def current_account
      current_account = current_user.account if signed_in?
    end

end
