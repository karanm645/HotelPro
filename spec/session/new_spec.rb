require 'rails_helper'

RSpec.describe "Session" do 
  describe "when a user successfully logs in" do 
    it "creates a session" do 
      visit "/"

      click_link("Log In")

      visit "/login"
      fill_in("Username", with: "karanm645")
      fill_in("Password", with: "abcd")
      click_button("Log In")
    end 
  end   
end