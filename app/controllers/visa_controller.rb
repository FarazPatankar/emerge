class VisaController < ApplicationController
  def pull

  	results = VisaApi.new().pullFundsTransaction

  	puts results

	redirect_to root_path

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

end
