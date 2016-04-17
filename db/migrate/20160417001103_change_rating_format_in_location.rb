class ChangeRatingFormatInLocation < ActiveRecord::Migration
	def up
	change_column :locations, :rating, :float
	end

	def down
	change_column :locations, :rating, :integer
	end
end
