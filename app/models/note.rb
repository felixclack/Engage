# == Schema Information
# Schema version: 20090914231505
#
# Table name: notes
#
#  id         :integer(4)      not null, primary key
#  body       :text
#  created_by :integer(4)
#  partner_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Note < ActiveRecord::Base
  
  attr_accessible :body
  
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
  belongs_to :partner
  
  validates_presence_of :body
  validates_presence_of :partner
  validates_presence_of :creator
end
