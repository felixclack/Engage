# == Schema Information
# Schema version: 20090830141104
#
# Table name: partners
#
#  id                  :integer(4)      not null, primary key
#  title               :string(255)
#  first_name          :string(255)
#  middle_names        :string(255)
#  last_name           :string(255)
#  email               :string(255)
#  mobile_phone        :string(255)
#  home_phone          :string(255)
#  deleted_at          :datetime
#  account_id          :integer(4)
#  created_by          :integer(4)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer(4)
#  avatar_updated_at   :datetime
#  twitter             :string(255)
#  facebook            :string(255)
#  dob                 :date
#  created_at          :datetime
#  updated_at          :datetime
#

class Partner < ActiveRecord::Base
  
  attr_accessible :full_name, :email, :mobile_phone, :home_phone, :title, :twitter, :facebook, :dob
  
  acts_as_human :require_last_name => false
  
  belongs_to :account
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
  
  validates_presence_of :account
  validates_presence_of :creator
  
  validate :partner_and_creator_have_same_account
  
  has_attached_file :avatar, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                    :default_url => "/images/default_:style_avatar.jpg"

  is_paranoid
  
  private
    def partner_and_creator_have_same_account
      if creator
        errors.add(:creator, "Creator must belong to the same account as the partner") unless self.account == self.creator.account
      end
    end
  
end
