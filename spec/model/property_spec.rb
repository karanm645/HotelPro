require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:street)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:state)}
    it { should validate_presence_of(:zip_code)}
    it { should validate_presence_of(:phone_number)}
  end 

  describe 'relations' do 
    it { should belong_to :user}
    it { should have_many :rooms}
  end 
end 
