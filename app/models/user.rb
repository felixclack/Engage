# == Schema Information
# Schema version: 20090830063030
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  email              :string(255)
#  encrypted_password :string(128)
#  salt               :string(128)
#  token              :string(128)
#  token_expires_at   :datetime
#  email_confirmed    :boolean(1)      not null
#  first_name         :string(255)
#  middle_names       :string(255)
#  last_name          :string(255)
#  admin              :boolean(1)
#  account_id         :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#

class User < ActiveRecord::Base
  include Clearance::User
  
  attr_accessible :full_name
  
  belongs_to :account
  
  acts_as_human :require_last_name => false
  
  has_attached_file :avatar, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                    :default_url => "/images/default_:style_avatar.jpg"
end
