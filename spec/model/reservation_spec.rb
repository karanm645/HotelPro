require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:date_in)}
    it { should validate_presence_of(:date_out)}
  end 

  describe 'relations' do 
    it { should belong_to :guest}
    it { should have_many :occupied_rooms}
  end 

  describe 'class methods' do 
    describe '#todays_arrivals' do 
      it 'can find arrivals for today' do 
        @user = User.create!(username: "karanm645", password: "123")
        @property = @user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)
        @guest1 = @property.guests.create!(first_name: "karan", last_name: "mehta", phone_number: "7202229389")
        @guest2 = @property.guests.create!(first_name: "joe", last_name: "junior", phone_number: "383092830")
        @guest3 = @property.guests.create!(first_name: "nore", last_name: "senior", phone_number: "38023892")
        @reservation1 = @guest1.reservations.create!(date_in: Date.today, date_out: '2023-09-23')
        @reservation2 = @guest2.reservations.create!(date_in: '2023-10-22', date_out: '2023-11-22')
        @reservation3 = @guest3.reservations.create!(date_in: Date.today, date_out: '2023-09-26')
        
        expect(Reservation.todays_arrivals).to eq([@guest1, @guest3])
      end 
    end 
  end 
end 
