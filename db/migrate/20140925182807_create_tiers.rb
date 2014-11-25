class CreateTiers < ActiveRecord::Migration
  def change
    create_table :tiers do |t|
      t.integer :importance
      t.float :start_value
      t.float :end_value
      t.references :stat_search, index: true

      t.timestamps
    end
  end
end
