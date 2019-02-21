require 'rails_helper'

RSpec.describe User, type: :model do
    before do
        @user = User.new(email:'a@a.com')
    end
    it "creates the user" do
   expect(@user).to be_valid
  end
  it "test for email presence" do
    @user.email = ''
    expect(@user).to be_invalid
  end
  it "generates remember token upon creation" do
    @user.save
    expect(@user[:remember_token]).not_to be_nil
  end
  it "destroys dependant event with user" do
    event = Event.all.count
    @user = User.last
    @user.destroy
    expect(event).not_to eq(Event.all.count)
  end
  it "destroys dependant attendee with user" do
    attendee = Attendee.all.count
    @user = User.last
    @user.destroy
    expect(attendee).not_to eq(Attendee.all.count)
  end
end
