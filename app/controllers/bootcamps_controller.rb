class BootcampsController < ApplicationController
	before_action :authenticate_user!, :only => [:join]

	def show
		@bootcamp = Bootcamp.find(params[:id])
		@types = ['store','atm', 'food', 'gym', 'hospital', 'library', 'parking', 'train_station']
		@icons = {"atm"=>"credit_card","food"=>"restaurant","gym"=>"directions_run","hospital"=>"local_hospital","library"=>"local_library","parking"=>"local_parking","train_station"=>"train"}
	end

	def join
		@bootcamp = Bootcamp.find(params[:id])
		@user = User.find(current_user.id)
		UserMailer.request_email(@user, @bootcamp).deliver_now
		redirect_to "/bootcamps/" + params[:id]
	end

	def accept
		@bootcamp = Bootcamp.find(params[:bootcamp_id])
		@user = User.find(params[:id])

		@user.bootcamp = @bootcamp.name
		@user.save

		redirect_to "/"
	end

	def reject
		redirect_to "/"
	end
end
