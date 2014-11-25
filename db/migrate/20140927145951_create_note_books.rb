class CreateNoteBooks < ActiveRecord::Migration
  def change
    create_table :note_books do |t|
      t.references :player_profile, index: true
      t.references :recruiter_profile, index: true
      t.text :notes
      t.string :status

      t.timestamps
    end
  end
end
