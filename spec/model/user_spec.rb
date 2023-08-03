require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do 
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:password)}
  end 

  describe 'relations' do 
    it { should have_many :properties}
  end 
end 
