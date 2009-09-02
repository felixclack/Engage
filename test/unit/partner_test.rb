require 'test_helper'

class PartnerTest < ActiveSupport::TestCase
  
  def setup
    @account = Factory(:account)
    @user = Factory(:user, :account => @account)
    @partner = Factory(:partner, :creator => @user, :account => @account)
  end
  
  subject { @partner }
  
  should_validate_presence_of :first_name, :message => "first name is required"
  should_validate_presence_of :account
  should_validate_presence_of :creator
  
  should "validate creator and partner belong to the same account" do
    new_account = Factory(:account, :name => "Another Account")
    user = Factory(:another_user, :account => new_account)
    @partner.creator = user
    
    @partner.invalid?.should be(true)
  end
  
  should_allow_mass_assignment_of :full_name, :mobile_phone, :home_phone, :email, :title, :twitter, :facebook, :dob
  should_not_allow_mass_assignment_of :account, :created_by
  
  should_belong_to :account
  should_belong_to :creator
  
  should_have_attached_file :avatar
  
  context "deleting a partner" do
    setup do
      @partner.destroy
    end

    should_change("the partner count", :from => 1, :to => 0) { Partner.count }
    should_not_change("the with deleted partner count") { Partner.count_with_destroyed }
  end
    
end
