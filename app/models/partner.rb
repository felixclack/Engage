# == Schema Information
# Schema version: 20090830141104
#
# Table name: partners
#
#  id           :integer(4)      not null, primary key
#  first_name   :string(255)
#  middle_names :string(255)
#  last_name    :string(255)
#  email        :string(255)
#  phone        :string(255)
#  deleted_at   :datetime
#  account_id   :integer(4)
#  created_by   :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

class Partner < ActiveRecord::Base
  
  attr_accessible :full_name, :email, :phone
  
  acts_as_human :require_last_name => false
  
  belongs_to :account
  
end
