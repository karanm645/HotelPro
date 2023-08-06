require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:type)}
    it { should validate_presence_of(:price)}
    it { should validate_presence_of(:smoking)}
    it { should validate_presence_of(:count)}
  end 

  describe 'relations' do 
    it { should belong_to :property}
  end 
end 
