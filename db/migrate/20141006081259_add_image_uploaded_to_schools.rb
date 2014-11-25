class AddImageUploadedToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :image_uploaded, :boolean
  end
end
