class AddFieldsToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :varsity, :boolean
    add_column :teams, :duration, :integer
  end
end
