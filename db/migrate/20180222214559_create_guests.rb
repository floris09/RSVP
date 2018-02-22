class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :adults
      t.string :children
      t.string :food_preference
      t.integer :adults_total
      t.integer :children_total
      t.boolean :attending
      t.references :wedding, foreign_key: true

      t.timestamps
    end
  end
end
