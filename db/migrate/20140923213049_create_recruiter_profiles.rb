class CreateRecruiterProfiles < ActiveRecord::Migration
  def change
    create_table :recruiter_profiles do |t|
      t.string :school
      t.references :sport, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
