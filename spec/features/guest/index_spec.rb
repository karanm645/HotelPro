require 'rails_helper'

RSpec.describe "Guest Index Page" do 
  describe 'when user visits guest index page' do 
    before(:each) do 
      @user = User.create!(username: "karanm645", password: "123")
      @property = @user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)
      @guest = @property.guests.create!(first_name: "karan", last_name: "mehta", phone_number: "7202229389")
      visit "/users/#{@user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"

      visit user_property_guests_path

      expect(page).to have_content("All guests")
      expect(page).to have_link("View Information")
      expect(page).to have_link("Edit Guest")
    end 
  end 
end 