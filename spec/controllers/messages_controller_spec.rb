require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  before {sign_in user}

  it "create a new message" do
    post :create, message: Fabricate.attributes_for(:message, job: job)
    expect(Message.last.attributes).to include({
      "sender_id" => user.id,
      "sender_type" => "User",
      "job_id" => job.id})
  end  

  it "validates the content of the message" do
    create_message = post :create, message: Fabricate.attributes_for(:message, content: "", job: job)
    expect(create_message).to redirect_to job
    expect(Message.last).to be_nil
    expect(flash[:notice]).to be_present
  end

  let(:user) {Fabricate(:user)}
  let(:job) {Fabricate(:job)}
end
