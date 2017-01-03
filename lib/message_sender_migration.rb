class MessageSenderMigration 

	def self.sender_message
		messages = Message.all
		messages.each do |message|
			message.sender_id = message.user_id || message.recruiter_id
			if message.sender_id == message.user_id
				message.sender_type = "User"
			else
				message.sender_type = "Recruiter"
			end
			message.save
		end
	end
end