# == Schema Information
# Schema version: 20090915215305
#
# Table name: households
#
#  id         :integer(4)      not null, primary key
#  street     :string(255)
#  town       :string(255)
#  county     :string(255)
#  postcode   :string(255)
#  country    :string(255)
#  phone      :string(255)
#  account_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Household < ActiveRecord::Base
  attr_accessible :address
  
  composed_of :address,
              :mapping => [ 
                %w(street street), 
                %w(town town), 
                %w(county county), 
                %w(postcode postcode),
                %w(country country)
              ]
end
