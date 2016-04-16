class AddNumberToBootcamps < ActiveRecord::Migration
  def change
    add_column :bootcamps, :number, :string
  end
end
