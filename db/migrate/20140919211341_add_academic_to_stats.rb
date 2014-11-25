class AddAcademicToStats < ActiveRecord::Migration
  def change
    add_column :stats, :academic, :boolean
  end
end
