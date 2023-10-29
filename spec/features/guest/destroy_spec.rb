require 'rails_helper'

RSpec.describe "Delete Guests", type: :feature do 
  describe "when i visit the guest show page" do 
    xit 'has a button to delete the property' do 
      @user = User.create(username: "karanm645", password: "123")
      visit "/users/#{@user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"

      @property = @user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)
      @guest = @property.guests.create!(first_name: "karan", last_name: "mehta", phone_number: "7202229389")

      visit user_property_guest_path(@user, @property, @guest)
      expect(page).to have_content(@guest.first_name)

      click_button "Delete"

      visit user_property_guests_path(@user, @property)
      #expect(page).to_not have_content("days inn")
    end 
  end 
end 