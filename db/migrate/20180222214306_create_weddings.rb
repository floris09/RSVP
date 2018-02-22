class CreateWeddings < ActiveRecord::Migration[5.1]
  def change
    create_table :weddings do |t|
      t.string :name
      t.date :date
      t.string :location

      t.timestamps
    end
  end
end
