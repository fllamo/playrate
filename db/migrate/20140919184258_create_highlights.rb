class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :custom_title
      t.string :video_url
      t.references :player_profile, index: true

      t.timestamps
    end
  end
end
