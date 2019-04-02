require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @user = User.first
  end
  it "creates event" do
    event = @user.events.build(title:'some',date:Time.now)
    expect(event).to be_valid
  end
  it "requires title" do
    event = @user.events.build(title:'',date:Time.now)
    event.valid?
    expect(event.errors[:title]).to include("can't be blank")
  end
  it "requires date" do
    event = @user.events.build(title:'some',date:'')
    expect(event).not_to be_valid
  end
  it "checks upcoming events" do
    event = Event.upcoming(Time.now).first
    expect(event.date).to be > Time.now
  end
  it "checks past events" do
    event = Event.past(Time.now).first
    expect(event.date).not_to be > Time.now
  end
  it "destroys dependent attendee" do
    attendee = Attendee.all.count
    event = Event.last
    event.destroy
    expect(attendee).not_to eq(Attendee.all.count)
  end
end
