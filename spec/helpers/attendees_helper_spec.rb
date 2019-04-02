require 'rails_helper'
include ApplicationHelper

# Specs in this file have access to a helper object that includes
# the AttendeesHelper. For example:
#
# describe AttendeesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AttendeesHelper, type: :helper do
  # describe "single event" do
  #   before do
  #     @event = Event.first
  #   end
  #   it "shows array of elements" do
  #     expect
  #   end
  # end
  describe "creator name" do
    before do
      @a = Event.first
      @name = User.find(@a.user_id).email.split('@')[0].capitalize
      cookies[:remember_token] = User.last[:remember_token]
      params[:id] = "3"
    end
    it "shows event creator name" do
      expect(event_creator(@a.user_id)).to eq(@name)
    end
    it "returns to if logged in user is creator" do
      expect(is_creator(@a)).not_to be_truthy
    end
    it "shows array of accepted events" do
      expect(accepted).to be_empty
    end
    it "shows array of pending invitations" do
        expect(pending_invitation).not_to be_empty
    end
    it "gives array of events" do
      @invitations = Attendee.all 
      expect(single_invitation).not_to be_empty
    end
  end
end
