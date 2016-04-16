class StaticPagesController < ApplicationController
	def home
		@bootcamps = Bootcamp.all
	end
end
