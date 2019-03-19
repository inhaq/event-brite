require 'spec_helper'

describe "the signin process", type: :feature do

  it "signs me in" do
    visit '/home'
    expect(page).to have_content 'Sign In First'
  end
end