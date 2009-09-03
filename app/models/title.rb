# == Schema Information
# Schema version: 20090903180253
#
# Table name: titles
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Title < ActiveRecord::Base
  finder :name
  selectable
  
  validates_presence_of :name
end
