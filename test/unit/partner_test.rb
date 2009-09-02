require 'test_helper'

class PartnerTest < ActiveSupport::TestCase
  
  setup do
    @partner = Factory(:partner)
  end
  
  should_validate_presence_of :first_name, :message => "first name is required"
  should_validate_presence_of :account
  
  should_allow_mass_assignment_of :full_name, :phone, :email
  should_not_allow_mass_assignment_of :account, :created_by
  
  should_belong_to :account
  
  should_have_attached_file :avatar
  
end
