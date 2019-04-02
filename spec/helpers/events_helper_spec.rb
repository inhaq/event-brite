require 'rails_helper'
include ApplicationHelper
# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
#
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EventsHelper, type: :helper do
    describe "events past and upcoming" do
      before do
      cookies[:remember_token] = User.last[:remember_token]
      end
      it 'shows upcoming accepted events' do
        expect(upcoming_accepted_events).not_to be_nil
      end
      it 'shows upcoming accepted events' do
        expect(prev_accepted_events).not_to be_empty
      end
      it 'shows upcoming events' do
        @events = Event.all
        @upcoming = @events.upcoming(Time.now)
        expect(upcoming_events).not_to be_empty
      end
      it 'shows past events' do
        @events = Event.all
        @upcoming = @events.past(Time.now)
        expect(prev_events).not_to be_empty
      end
    end
end
