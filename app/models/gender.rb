# == Schema Information
# Schema version: 20090914231505
#
# Table name: genders
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Gender < ActiveRecord::Base
  finder :name
  selectable
  
  validates_presence_of :name
end
