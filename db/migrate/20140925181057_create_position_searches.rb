class CreatePositionSearches < ActiveRecord::Migration
  def change
    create_table :position_searches do |t|
      t.references :recruiter_profile, index: true
      t.references :sport, index: true
      t.references :position, index: true
      t.string :name

      t.timestamps
    end
  end
end
