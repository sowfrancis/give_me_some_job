class Message < ActiveRecord::Base
  belongs_to :job
  belongs_to :sender, polymorphic: true

  validates_presence_of :content
end
