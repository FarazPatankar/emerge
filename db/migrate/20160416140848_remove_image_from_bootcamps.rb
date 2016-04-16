class RemoveImageFromBootcamps < ActiveRecord::Migration
  def change
    remove_column :bootcamps, :image, :string
  end
end
