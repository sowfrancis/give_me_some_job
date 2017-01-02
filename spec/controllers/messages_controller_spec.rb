require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  before {sign_in user}

  it "create a new message" do
    post :create, message: Fabricate.attributes_for(:message, job: job)
    expect(Message.last.attributes).to include({
      "user_id" => user.id,
      "recruiter_id" => nil,
      "job_id" => job.id})
  end  

  let(:user) {Fabricate(:user)}
  let(:job) {Fabricate(:job)}
end
