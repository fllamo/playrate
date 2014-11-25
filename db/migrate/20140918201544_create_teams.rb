class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :coach
      t.string :coach_phone
      t.string :coach_email
      t.boolean :testimonial_requested
      t.text :testimonial
      t.integer :jersey_number
      t.references :player_profile, index: true

      t.timestamps
    end
  end
end
