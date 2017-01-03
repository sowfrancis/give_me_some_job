require 'rails_helper'
require_relative '../../lib/message_sender_migration'

RSpec.describe MessageSenderMigration do

	it "imports the sender's data for user" do
		user = Fabricate(:user)
		job = Fabricate(:job)
		message = Message.create(job_id: job.id, user_id: user.id, content: "YOYO")
		MessageSenderMigration.sender_message
		message.reload
		expect(message.sender_id).to eq user.id
	end

	it "import the sender's data for recruiter" do
		recruiter = Fabricate(:recruiter)
		job = Fabricate(:job)
		message = Message.create(job_id: job.id, recruiter_id: recruiter.id, content: "Hello")
		MessageSenderMigration.sender_message
		message.reload
		expect(message.sender_id).to eq recruiter.id
	end

	it "import the sender's type for user" do
		user = Fabricate(:user)
		job = Fabricate(:job)
		message = Message.create(job_id: job.id, user_id: user.id, content: "YOYO")
		MessageSenderMigration.sender_message
		message.reload
		expect(message.sender_type).to eq user.class.to_s
	end

	it "import the sender's type for recruiter" do
		recruiter = Fabricate(:recruiter)
		job = Fabricate(:job)
		message = Message.create(job_id: job.id, recruiter_id: recruiter.id, content: "YOYO")
		MessageSenderMigration.sender_message
		message.reload
		expect(message.sender_type).to eq recruiter.class.to_s
	end

end