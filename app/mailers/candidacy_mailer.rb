class CandidacyMailer < ActionMailer::Base
	default from: "from@example.com"

	def candidacy_email(recruiter, user)
		@recruiter = recruiter
		@user = user
		mail(to: @recruiter.email, subject: 'Vous avez un candidat!YAY')
	end

end