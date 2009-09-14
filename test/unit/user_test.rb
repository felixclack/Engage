require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  
  setup do
    @user = Factory(:user)
  end
  
  should_have_db_columns :email, :encrypted_password, :token
  
  should_belong_to :account
  
  should_not_allow_mass_assignment_of :account
  
  should_allow_mass_assignment_of :full_name, :admin
  
  should_have_attached_file :avatar
end
