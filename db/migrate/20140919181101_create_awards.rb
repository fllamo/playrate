class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :name
      t.references :player_profile, index: true

      t.timestamps
    end
  end
end
