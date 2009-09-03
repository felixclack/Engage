class Gender < ActiveRecord::Base
  finder :name
  selectable
  
  validates_presence_of :name
end
