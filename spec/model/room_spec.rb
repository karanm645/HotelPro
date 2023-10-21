require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:room_type)}
    it { should validate_presence_of(:price)}
    it { should validate_presence_of(:room_number)}
    it { should validate_presence_of(:vacant)}
  end 

  describe 'relations' do 
    it { should belong_to :property}
    it { should have_many :occupied_rooms}
  end 

describe "class methods" do 
    describe "#vacant_rooms" do 
      it 'shows rooms that do not have guests occupying it' do 
        @user = User.create!(username: "karanm645", password: "123")
        @property = @user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)
        @room1 = @property.rooms.create!(room_type: "NK1", price: 16.99, smoking: true, room_number: 114, vacant: true)
        @room2 = @property.rooms.create!(room_type: "NDD1", price: 59.99, smoking: true, room_number: 116, vacant: true)
        @room3 = @property.rooms.create!(room_type: "SNK1", price: 59.99, smoking: true, room_number: 118, vacant: true)
        @guest1 = @property.guests.create!(first_name: "karan", last_name: "mehta", phone_number: "7202229389")
        @guest2 = @property.guests.create!(first_name: "joe", last_name: "junior", phone_number: "383092830")
        @guest3 = @property.guests.create!(first_name: "nore", last_name: "senior", phone_number: "38023892")
        @reservation1 = @guest1.reservations.create!(date_in: Date.today, date_out: '2023-09-23')
        @reservation2 = @guest2.reservations.create!(date_in: '2023-10-22', date_out: '2023-11-22')
        @reservation3 = @guest3.reservations.create!(date_in: Date.today, date_out: '2023-09-26')
        @occupiedroom1 = OccupiedRoom.create!(reservation_id: @reservation1.id, room_id: @room1.id)
        @occupiedroom2 = OccupiedRoom.create!(reservation_id: @reservation2.id, room_id: @room2.id)

        expect(Room.vacant_rooms).to eq([@room3])
      end 
    end 
  end 

end 
