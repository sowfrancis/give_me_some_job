module ControllerHelpers
  def sign_in(recruiter_or_user)
  	if recruiter_or_user.class == Recruiter
	    allow(controller).to receive(:current_recruiter).and_return(recruiter_or_user)  
	  else  
	    allow(controller).to receive(:current_user).and_return(recruiter_or_user)
	  end
  end
end