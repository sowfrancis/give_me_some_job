class MessageDecorator < SimpleDelegator
	
	def sender_image
  	if sender_type == "Recruiter" 	
      sender.recruiterimg 
    else 
      sender.userimg 
		end
	end
end