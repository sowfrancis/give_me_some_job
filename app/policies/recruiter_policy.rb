class RecruiterPolicy

  def initialize(current_recruiter,record)
    @record = record
    @current_recruiter = current_recruiter
  end

  def new?
  end

  def update?
    @record == @current_recruiter
  end

  def edit?
    update?
  end
end