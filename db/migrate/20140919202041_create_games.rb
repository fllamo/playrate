class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :when
      t.string :location
      t.references :player_profile, index: true

      t.timestamps
    end
  end
end
