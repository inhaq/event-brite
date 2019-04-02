require 'rails_helper'
include ApplicationHelper
# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  describe "user logged in and the name" do
    before do
      cookies[:remember_token] = User.last[:remember_token]
    end
    it "looks for user with given cookie" do
      expect(user).not_to be_nil
    end
    it "looks approves user with cookie" do
      expect(user).to be_truthy
    end
    it "gives permission for appropriete cookie" do
      expect(logged_in?).not_to be_falsy
    end
    it "return the string" do
      expect(name).not_to be_nil
    end
    it "shows peneding invitations" do
      expect(pending_invitations_u.count).not_to eq(1)
    end
    it "logges user in" do
      expect(login(User.last)).not_to be_nil
    end
  end
  describe "parms response" do
    before do
      cookies[:remember_token] = User.last[:remember_token]
      params[:id] = User.find(4).id
      params[:user] = {email: "some@some.com"} 
    end
    it "show user name from params" do
      expect(get_uname).not_to be_nil
    end
    # it "redirect from profile to home" do
    #   expect(only_you).to redirect_to(home_path)
    # end
    it "checks if user email exists" do
      expect(check_user_in_db).to be_nil
    end
  end
end
