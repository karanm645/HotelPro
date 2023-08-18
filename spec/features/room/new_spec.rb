require 'rails_helper'

RSpec.describe "Property Form" do 
  describe 'when user clicks the add property button' do 
    before(:each) do 
      @user = User.create(username: "karanm645", password: "123")
      @property1 = @user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)

      visit "/users/#{@user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"

      expect(page).to have_link("View Properties")

      click_link "View Properties"
      visit user_properties_path(@user)
            expect(page).to have_text(@property1.name)

      click_link @property1.name
      expect(page).to have_link("View Rooms")
      
      click_link("View Rooms")
      expect(page).to have_link("Add Rooms")
      click_link("Add Rooms")

      visit new_user_property_room_path(@user, @property1)
    end 
    it 'will take them to the form' do
      fill_in('Room type', with: 'King')
      fill_in('Price', with: 59.99)
      check 'Smoking'
      fill_in('Count', with: 20)
      fill_in('Room number', with: 114)


      click_button("Submit")
      visit user_property_rooms_path(@user, @property1)
    end 

    it 'has a back link to the rooms index page' do 
      click_link "Back"

      visit user_property_rooms_path(@user, @property1)
    end 
  end 
end 