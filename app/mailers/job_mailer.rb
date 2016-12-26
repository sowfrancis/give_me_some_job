class JobMailer < ActionMailer::Base
	default from: "from@example.com"

	def new_job_email(recruiter)
    @recruiter = recruiter
    mail(to: @recruiter.email, subject: 'La nouvelle mission que vous venez de créer à bien été enregistré!')
	end
end