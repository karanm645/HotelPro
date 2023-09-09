require 'rails_helper'

RSpec.describe "Guest Form" do 
  describe 'when user clicks the edit guest button' do 
    before(:each) do 
      @user = User.create!(username: "karanm645", password: "123")
      @property = @user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)
      @guest = @property.guests.create!(first_name: "karan", last_name: "mehta", phone_number: "7202229389")
      visit "/users/#{@user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"

      visit user_property_guests_path(@user, @property)

      expect(page).to have_link("Edit Guest")

      click_link "Edit Guest"
      visit edit_user_property_guest_path(@user, @property, @guest)
      expect(page).to have_text("Edit Guest Information")
    end 
    
    it 'will take them to the form' do
      fill_in('First name', with: 'Hansel')
      fill_in('Last name', with: 'Nialapho')
      fill_in('Phone number', with: "8830002000")

      click_button("Submit")

      @guest = Guest.last
      visit user_property_guests_path(@user, @property)
    end 
  end 
end 