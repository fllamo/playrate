class AddContactsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :contacts, :text
  end
end
