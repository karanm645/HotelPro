require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:date_in)}
    it { should validate_presence_of(:date_out)}
  end 

  describe 'relations' do 
    it { should belong_to :guest}
  end 
end 
