class UserPolicy

  def initialize(current_user,record)
    @record = record
    @current_user = current_user
  end

  def new?
  end

  def update?
    @record == @current_user
  end

  def edit?
    update?
  end
end