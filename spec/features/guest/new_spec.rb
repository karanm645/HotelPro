require 'rails_helper'

RSpec.describe "Guest Form" do 
  describe 'when user clicks the create guest button' do 
    before(:each) do 
      @user = User.create(username: "karanm645", password: "123")
      @property = @user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)

      # @guest = Guest.create(first_name: "karan", last_name: "mehta", phone_number: "7202229389")
      visit "/users/#{@user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"

      visit guests_path(@user, @property)
      expect(page).to have_link("Create New Guest")

      click_link "Create New Guest"
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
    end 

    xit 'has a back button to the user show page' do 
      click_link "Back"

      visit user_path(@user)
    end 
  end 
end 