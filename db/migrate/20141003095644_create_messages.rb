class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :conversation, index: true
      t.references :user, index: true
      t.text :body

      t.timestamps
    end
  end
end
