class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :player_profile, index: true
      t.references :recruiter_profile, index: true

      t.timestamps
    end
  end
end
