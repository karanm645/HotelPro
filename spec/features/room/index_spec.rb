require 'rails_helper'

RSpec.describe "Room Index Page", type: :feature do 
  describe "when I visit the room index page" do 
    before(:each) do 
      @user = User.create(username: "karanm645", password: "123")
      visit "/users/#{@user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"

      @property1 = @user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)
      @room1 = @property1.rooms.create!(room_type: "NK1", price: 16.99, smoking: true, count: 22, room_number: 114)
      
      visit user_property_rooms_path(@user, @property1)
    end 
    it 'has a link to add rooms' do 
      expect(page).to have_link("Add Rooms")
    end 

    it 'has a link to go back to the rooms show page' do 
      click_link "Back"

      visit user_property_rooms_path(@user, @property1)
    end 
  end 
end 