class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.float :value
      t.string :name
      t.references :player_profile, index: true

      t.timestamps
    end
  end
end
