require 'rails_helper'

RSpec.describe "Dashboard" do 
  describe 'when user visits property show page' do 
    before(:each) do 
      @user = User.create(username: "karanm645", password: "123")
      @property1 = @user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)
      @guest1 = @property1.guests.create!(first_name: "karan", last_name: "mehta", phone_number: "7202229389")
      @guest2 = @property1.guests.create!(first_name: "john", last_name: "lewis", phone_number: "328032803")
      @room1 = @property1.rooms.create!(room_type: "King", price: 59.99, smoking: true, room_number: 115)
      @room2 = @property1.rooms.create!(room_type: "Double", price: 69.99, smoking: false, room_number: 118)
      @room3 = @property1.rooms.create!(room_type: "Queen", price: 79.99, smoking: true, room_number: 113)
      @reservation1 = @guest1.reservations.create!(date_in: "2023-09-12", date_out: "2023-09-13", guest_id: @guest1.id)
      @reservation2 = @guest2.reservations.create!(date_in: "2023-11-12", date_out: "2023-11-13", guest_id: @guest2.id)
      @occupied_room1 = @reservation1.occupied_rooms.create!(room_id: @room1.id, reservation_id: @reservation1.id)
      @occupied_room2 = @reservation2.occupied_rooms.create!(room_id: @room2.id, reservation_id: @reservation2.id)
      visit "/users/#{@user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"

      visit user_property_path(@user, @property1)

      click_link "Dashboard"
      visit user_property_dashboards_path(@user, @property1)
    end    
    it 'should have the properties name' do 
      expect(page).to have_content(@property1.name)
    end 

    xit 'should have a back button to the property index page' do 
      click_link "Back"
      visit user_properties_path(@user)
    end 
  end 
end
