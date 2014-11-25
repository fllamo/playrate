class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :references
      t.references :player_profile, index: true
      t.references :school, index: true

      t.timestamps
    end
  end
end
