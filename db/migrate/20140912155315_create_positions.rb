class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
      t.string :stats, array: true, default: []
      t.references :sport

      t.timestamps
    end

    add_index :positions, :sport_id
  end
end
