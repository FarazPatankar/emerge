class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :gid
      t.string :icon
      t.text :address
      t.string :number
      t.integer :rating
      t.string :website

      t.timestamps null: false
    end
  end
end
