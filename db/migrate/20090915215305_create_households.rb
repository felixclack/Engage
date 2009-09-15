class CreateHouseholds < ActiveRecord::Migration
  def self.up
    create_table :households do |t|
      t.string      :street  
      t.string      :town    
      t.string      :county  
      t.string      :postcode
      t.string      :country
      t.string      :phone
      t.references  :account

      t.timestamps
    end
  end

  def self.down
    drop_table :households
  end
end
