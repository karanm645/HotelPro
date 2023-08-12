require 'rails_helper'

RSpec.describe "User Show Page" do 
  describe "it displays user show page" do 
    it "has a button to add property" do 
      user = User.create(username: "karanm645", password: "123")
      visit "/users/#{user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"
      #allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: user.id } }
      # binding.pry
      expect(page).to have_link("Add Property")
      expect(page).to have_link("View Properties")
      
      click_link "Add Property"
      visit new_user_property_path(user)
      expect(page).to have_text("Please Enter Your Property Information")
    end 
  end 
end 