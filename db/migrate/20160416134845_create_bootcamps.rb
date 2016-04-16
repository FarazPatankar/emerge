class CreateBootcamps < ActiveRecord::Migration
  def change
    create_table :bootcamps do |t|
      t.string :name
      t.text :address
      t.string :website
      t.string :image
      t.string :email
      t.decimal :lat
      t.decimal :lng
      t.text :description

      t.timestamps null: false
    end
  end
end
