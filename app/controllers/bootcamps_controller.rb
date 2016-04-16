class BootcampsController < ApplicationController
	def show
		@bootcamp = Bootcamp.find(params[:id])
	end
end
