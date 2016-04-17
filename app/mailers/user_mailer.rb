class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def request_email(user, bootcamp)
	@user = user
	@bootcamp = bootcamp
	# @accept_url  = 'http://localhost:3000/bootcamps/<%=@bootcamp.id%>/users/<%=@user.id%>/accept'
	# @reject_url  = 'http://localhost:3000/bootcamps/<%=@bootcamp.id%>/users/<%=@user.id%>/reject'
	mail(to: @bootcamp.email, subject: 'Some guy wants to join the camp')
	end
end
