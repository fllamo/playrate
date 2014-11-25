class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :conference
      t.string :division
      t.boolean :public
      t.string :state
      t.string :city
      t.string :website
      t.integer :avg_sat_reading_starts_at
      t.integer :avg_sat_reading_ends_at
      t.integer :avg_sat_math_starts_at
      t.integer :avg_sat_math_ends_at
      t.integer :avg_sat_writing_starts_at
      t.integer :avg_sat_writing_ends_at
      t.integer :avg_act_composite_starts_at
      t.integer :avg_act_composite_ends_at
      t.float :avg_gpa
      t.integer :enrollement_size

      t.timestamps
    end
  end
end
