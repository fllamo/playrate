class RemoveEndValueFromTiers < ActiveRecord::Migration
  def change
    remove_column :tiers, :end_value
  end
end
