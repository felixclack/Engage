require File.dirname(__FILE__) + '/../test_helper'

class NoteTest < ActiveSupport::TestCase
  should_have_db_columns :body, :created_by, :partner_id
  
  def setup
    @account = Factory(:account)
    @user = Factory(:user, :account => @account)
    @partner = Factory(:partner, :creator => @user, :account => @account)
    @note = Factory(:note, :partner => @partner, :creator => @user)
  end
  
  subject { @note }
  
  should_validate_presence_of :body, :partner, :creator
  
  should_not_allow_mass_assignment_of :partner, :creator
  should_allow_mass_assignment_of :body
  
  should_belong_to :partner
  should_belong_to :creator
end
