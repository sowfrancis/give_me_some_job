require 'rails_helper'
require_relative '../../lib/message_sender_migration'

RSpec.describe MessageSenderMigration do

  describe "sender message" do

    before do
      message
      MessageSenderMigration.sender_message
      message.reload
    end

    context "import user data to sender" do

      it "imports the sender's id" do
        expect(message.sender_id).to eq user.id
      end

      it "import the sender's type" do
        expect(message.sender_type).to eq "User"
      end

      let(:user) {Fabricate(:user)}
      let!(:message) do
        Fabricate(:message, sender: nil, recruiter_id: nil, user_id: user.id, sender_id: nil)
      end
    end

    context "import recruiter data to sender" do

      it "import the sender's id" do
        expect(message.sender_id).to eq recruiter.id
      end

      it "import the sender's type" do
        expect(message.sender_type).to eq recruiter.class.to_s
      end

      let!(:message) do
        Fabricate(:message, sender: nil, recruiter_id: recruiter.id, user_id: nil, sender_id: nil)
      end
    end

    let!(:recruiter) {Fabricate(:recruiter)}
  end
end