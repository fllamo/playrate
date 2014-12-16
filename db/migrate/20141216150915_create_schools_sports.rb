class CreateSchoolsSports < ActiveRecord::Migration
  def change
    create_table :schools_sports do |t|
      t.references :school, index: true
      t.references :sport, index: true
    end
  end
end
