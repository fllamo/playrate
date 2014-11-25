class AddOtherSportsToPlayerProfiles < ActiveRecord::Migration
  def change
    add_column :player_profiles, :other_sports, :string
  end
end
