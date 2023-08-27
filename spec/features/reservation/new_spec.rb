require 'rails_helper'

RSpec.describe "Reservation Form" do 
describe 'when user clicks the create reservation button' do 
    before(:each) do 
      @user = User.create(username: "karanm645", password: "123")
      @property = @user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)

      # @guest = Guest.create(first_name: "karan", last_name: "mehta", phone_number: "7202229389")
      visit "/users/#{@user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"

      visit user_property_rooms_path(@user, @property)
      expect(page).to have_link("New Guest")

      click_link "New Guest"
      visit new_guest_path
      expect(page).to have_text("Please Enter The Guest Information")
    end 
    
    it 'will take them to the form' do
      fill_in('First name', with: 'karan')
      fill_in('Last name', with: 'mehta')
      fill_in('Phone number', with: "8706335716")

      click_button("Submit")

      @guest = Guest.last
      visit new_guest_reservation_path(@guest)

      expect(page).to have_text("Please Enter Check In and Check Out dates")

      fill_in('Date in', with: '2023-11-19')
      fill_in('Date out', with: '2023-11-20')

      click_button("Submit")
    end 
  end 
end 