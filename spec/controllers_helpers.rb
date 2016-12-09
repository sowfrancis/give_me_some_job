module ControllerHelpers
  def sign_in(recruiter = double('recruiter'))
    if recruiter.nil?
      allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :recruiter})
      allow(controller).to receive(:current_recruiter).and_return(nil)
    else
      allow(request.env['warden']).to receive(:authenticate!).and_return(recruiter)
      allow(controller).to receive(:current_recruiter).and_return(recruiter)
    end
  end
end