require 'rails_helper'

RSpec.describe Guest, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:phone_number)}
  end 

  describe 'relations' do 
    it { should belong_to :property}
    xit { should have_many :reservations}
  end 
end 
