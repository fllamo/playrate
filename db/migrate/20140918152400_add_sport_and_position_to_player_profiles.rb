class AddSportAndPositionToPlayerProfiles < ActiveRecord::Migration
  def change
    add_reference :player_profiles, :sport, index: true
    add_reference :player_profiles, :position, index: true
  end
end
