# == Schema Information
# Schema version: 20090830063030
#
# Table name: accounts
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Account < ActiveRecord::Base
  
  attr_accessible :name
  
  has_many :users
  has_many :partners
  
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
  
end
