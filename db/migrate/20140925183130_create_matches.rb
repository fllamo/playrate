class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :search_score
      t.integer :total_score
      t.boolean :seen, default: false
      t.references :position_search, index: true
      t.references :player_profile, index: true

      t.timestamps
    end
  end
end
