require File.dirname(__FILE__) + '/../test_helper'

class AccountTest < ActiveSupport::TestCase
  
  setup do
    @account = Factory(:account)
  end
  
  should_have_db_column :name
  
  should_validate_presence_of :name
  should_validate_uniqueness_of :name, :case_sensitive => false
  
  should_allow_mass_assignment_of :name
  
  should_have_many :users, :partners
  
end
