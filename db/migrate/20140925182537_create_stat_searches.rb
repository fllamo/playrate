class CreateStatSearches < ActiveRecord::Migration
  def change
    create_table :stat_searches do |t|
      t.string :name
      t.references :position_search, index: true
      t.integer :coefficient, default: 0

      t.timestamps
    end
  end
end
