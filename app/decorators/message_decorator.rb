class MessageDecorator < SimpleDelegator
	
	def sender_image
  	if recruiter 	
      recruiter.recruiterimg 
    else 
      user.userimg 
		end
	end
end