class BootcampsController < ApplicationController
	def show
		@bootcamp = Bootcamp.find(params[:id])
		@types = ['store','atm', 'food', 'gym', 'hospital', 'library', 'parking', 'train_station']
		@icons = {"atm"=>"credit_card","food"=>"restaurant","gym"=>"directions_run","hospital"=>"local_hospital","library"=>"local_library","parking"=>"local_parking","train_station"=>"train"}
	end
end
