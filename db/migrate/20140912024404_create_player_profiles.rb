class CreatePlayerProfiles < ActiveRecord::Migration
  def change
    create_table :player_profiles do |t|
      t.string :phone
      t.string :parent_phone
      t.datetime :dob
      t.string :parent_email
      t.string :city
      t.string :street_address
      t.string :state
      t.string :zip
      t.string :school
      t.integer :graduation_year
      t.references :user

      t.timestamps
    end

    add_index :player_profiles, :user_id, unique: true
  end
end
