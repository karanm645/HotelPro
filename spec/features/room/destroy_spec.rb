require 'rails_helper'

RSpec.describe "Delete Room", type: :feature do 
  describe "when i visit the rooms show page" do 
    before(:each) do 
      @user = User.create(username: "karanm645", password: "123")
      visit "/users/#{@user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"
      
      @property1 = @user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)
      @room1 = @property1.rooms.create!(room_type: "NK1", price: 16.99, smoking: true, count: 22, room_number: 114)
      
      visit user_property_room_path(@user, @property1, @room1)
    end 
    it 'has a button to delete the room' do 
      expect(page).to have_content("NK1")

      click_button "Delete"

      expect(page).to_not have_content("NK1")
    end 

    it 'has a back link to rooms index page' do 
      click_link "Back"

      visit user_property_rooms_path(@user, @property1)
    end  
  end 
end 