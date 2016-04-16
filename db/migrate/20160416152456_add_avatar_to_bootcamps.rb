class AddAvatarToBootcamps < ActiveRecord::Migration
  def change
    add_column :bootcamps, :avatar, :string
  end
end
