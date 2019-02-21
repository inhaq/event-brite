require 'rails_helper'
include ApplicationHelper
RSpec.describe StaticsController, type: :controller do
    describe "GET show" do
        it "goes to root" do
            get :show
            expect(response).to render_template("show")
          end
    end
    describe "GET show" do
        before do
            cookies[:remember_token] = User.first[:remember_token]
        end
        it "redirects to home if logged in" do
            get :show
            expect(response).to have_http_status(302)
          end
    end
    describe "GET home" do
        before do
            cookies[:remember_token] = User.first[:remember_token]
        end
        it "loged in to home page" do
            get :home
          expect(response).to render_template("home")
        end
    end
    describe "GET home" do
        it "redirect to login if not logged in" do
            get :home
          expect(response).to redirect_to login_path
        end
    end
end
