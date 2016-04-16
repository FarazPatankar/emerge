class BootcampsController < ApplicationController
	def show
		@bootcamp = Bootcamp.find(params[:id])
		@types = ['atm', 'food', 'gym', 'hospital', 'library', 'parking', 'train_station']
	end
end
