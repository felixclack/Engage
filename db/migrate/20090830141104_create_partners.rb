class CreatePartners < ActiveRecord::Migration
  def self.up
    create_table :partners do |t|
      t.references  :title
      t.string      :first_name
      t.string      :middle_names
      t.string      :last_name
      t.string      :email
      t.string      :mobile_phone
      t.string      :home_phone
      t.datetime    :deleted_at
      t.integer     :account_id
      t.integer     :created_by
      t.string      :avatar_file_name
      t.string      :avatar_content_type
      t.integer     :avatar_file_size
      t.datetime    :avatar_updated_at
      t.string      :twitter
      t.string      :facebook
      t.date        :dob
      t.references  :gender
      t.string      :state
      t.references  :household
      t.timestamps
    end
    
    add_index :partners, :account_id
  end

  def self.down
    remove_index :partners, :account_id
    drop_table :partners
  end
end
