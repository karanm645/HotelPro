require 'rails_helper'

RSpec.describe "Edit Room", type: :feature do 
  describe "when I visit the room show page" do 
    it 'has a link to edit the room' do 
      user = User.create(username: "karanm645", password: "123")
      visit "/users/#{user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"

      property1 = user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)
      room1 = property1.rooms.create!(room_type: "NK1", price: 16.99, smoking: true, count: 22, room_number: 114)
      
      visit user_property_room_path(user, property1, room1)

      click_link "Edit"

      visit edit_user_property_room_path(user, property1, room1)

      fill_in('Room type', with: 'Queen')
      fill_in('Price', with: 59.99)
      check 'Smoking'
      fill_in('Count', with: 20)
      fill_in('Room number', with: 114)

      click_button "Update"

      visit user_property_room_path(user, property1, room1)

      expect(page).to have_content("Queen")
    end 
  end 
end 