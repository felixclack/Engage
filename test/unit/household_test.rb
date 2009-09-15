require File.dirname(__FILE__) + '/../test_helper'

class HouseholdTest < ActiveSupport::TestCase
  should_have_db_columns :street, :town, :county, :postcode, :country, :account_id
  
  should_allow_mass_assignment_of :address
  should_not_allow_mass_assignment_of :account
end
