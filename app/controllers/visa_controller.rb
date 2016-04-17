class VisaController < ApplicationController

  def pull

  	results = VisaApi.new().pullFundsTransaction

  	# Confirms Transaction was complete
  	if results["actionCode"] == "00"

  		puts results
		redirect_to donate_confirm_path

	else

		redirect_to donate_path

	end

  end

  def push

  	results = VisaApi.new().pushFundsTransaction

  	puts results

	redirect_to root_path

  end

  def reverse

  	results = VisaApi.new().reverseFundsTransaction

  	puts results

	redirect_to root_path

  end

  def donate
  end

end
