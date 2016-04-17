class LocationsController < ApplicationController
	before_action :authenticate_user!, :only => [:show]

	def show
		@location = Location.find_by(gid: params[:id])
		@rating = @location.rating
		remainder = @rating - @rating.floor
		if remainder > 0.5
			@halfstar="star_half"
		end
	end

	def create
		if Location.find_by(gid: location_params["gid"]) == nil
			location = Location.create(location_params)
			render json: location
		else
			render :json => ""
		end
	end



	def upvote

		@location = Location.find_by(gid: params[:location])

		@location.upvote_from current_user

		render json: @location

	end


	def downvote

		@location = Location.find_by(gid: params[:location])

		@location.downvote_from current_user

		render json: @location

	end



	private

	def location_params
		params.require(:location).permit(:gid, :website, :name, :icon, :address, :number, :rating)
	end

end
