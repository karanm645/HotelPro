require 'rails_helper'

RSpec.describe "Occupied Room Form" do 
  describe 'when user clicks the check_in button' do 
    before(:each) do 
      @user = User.create(username: "karanm645", password: "123")
      visit "/users/#{@user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"

      @property = @user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)
      @room = @property.rooms.create!(room_type: "NK1", price: 16.99, smoking: true, count: 22, room_number: 114)
      @guest = @property.guests.create!(first_name: "karan", last_name: "mehta", phone_number: "7202229389")
      @reservation = @guest.reservations.create!(date_in: '2023-11-19', date_out: '2023-11-20')
      

      visit guest_reservation_path(@guest, @reservation)
      expect(page).to have_text("Page of #{@guest.first_name} #{@guest.last_name}")
    end 
    
    it 'will create occupied room with room and reservation' do

      click_link("Check In Page")

      visit guest_reservation_occupied_rooms_path(@guest, @reservation)
    end 


  end 
end 