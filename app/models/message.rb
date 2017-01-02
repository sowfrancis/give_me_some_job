class Message < ActiveRecord::Base
  belongs_to :job
  belongs_to :user
  belongs_to :recruiter

  validates_presence_of :content
end
