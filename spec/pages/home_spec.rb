require 'rails_helper'

RSpec.describe "Home Page" do 
  describe "root page" do 
    it "returns a successful response" do 
      visit "/"

      expect(current_path).to eq("/")
      expect(page).to have_content("Welcome to HotelPro!")
    end 
  end 
end 