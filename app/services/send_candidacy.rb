class SendCandidacy

  def initialize(job, user)
    @user = user
    @job = job
  end

  def send_new_candidacy
    candidacy = create_candidacy
    send_candidacy_email
    candidacy
  end


  private

  def recruiter
    @job.recruiter
  end

  def send_candidacy_email
    CandidacyMailer.candidacy_email(recruiter, @user).deliver_now
  end

  def create_candidacy
    Candidacy.create(job_id: @job.id , user_id: @user.id)
  end

end