require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:room_type)}
    it { should validate_presence_of(:price)}
    it { should validate_presence_of(:room_number)}
    it { should validate_presence_of(:count)}
  end 

  describe 'relations' do 
    it { should belong_to :property}
    it { should have_many :occupied_rooms}
  end 
end 
