class LocationsController < ApplicationController

	def show
	end

	def create
		if Location.find_by(gid: location_params["gid"]) == nil
			location = Location.create(location_params)
			render json: location
		else
			render :json => "" 
		end
	end


	private

	def location_params
		params.require(:location).permit(:gid, :website, :name, :icon, :address, :number, :rating)
	end

end
