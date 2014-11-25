class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :sid
      t.text :body
      t.references :team, index: true

      t.timestamps
    end
  end
end
