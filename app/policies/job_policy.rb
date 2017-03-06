class JobPolicy

  def initialize(current_recruiter,record)
    @record = record
    @current_recruiter = current_recruiter
  end

  def new?
    @current_recruiter.present?
  end

  def update?
    @record.recruiter == @current_recruiter
  end

  def edit?
    update?
  end
end