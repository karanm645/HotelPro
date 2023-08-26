require 'rails_helper'

RSpec.describe OccupiedRoom, type: :model do
  describe 'relations' do 
    it { should belong_to :room}
    it { should belong_to :reservation}
  end 

end 
