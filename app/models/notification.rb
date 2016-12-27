class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :recruiter
  belongs_to :job
end
