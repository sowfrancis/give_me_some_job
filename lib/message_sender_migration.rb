class MessageSenderMigration

  def self.sender_message
    Message.all.each do |message|
      message.update({
        sender_id: sender_id(message),
        sender_type: sender_type(message)
      })
    end
  end

  private

  def self.sender_id(message)
    message.user_id || message.recruiter_id
  end

  def self.sender_type(message)
    if message.user_id.present?
      "User"
    else
      "Recruiter"
    end
  end
end