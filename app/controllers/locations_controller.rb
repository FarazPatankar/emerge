class LocationsController < ApplicationController

	def show
		location = Location.create(location_params)
		render json: location
	end

	def create
	
	end

	private

	def location_params
		params.require(:location).permit(:gid, :website, :name, :icon, :address, :number, :rating)
	end

end
