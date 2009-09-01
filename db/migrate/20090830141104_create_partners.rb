class CreatePartners < ActiveRecord::Migration
  def self.up
    create_table :partners do |t|
      t.string      :first_name
      t.string      :middle_names
      t.string      :last_name
      t.string      :email
      t.string      :phone
      t.datetime    :deleted_at
      t.integer     :account_id
      t.integer     :created_by
      t.timestamps
    end
    
    add_index :partners, :account_id
  end

  def self.down
    remove_index :partners, :account_id
    drop_table :partners
  end
end
