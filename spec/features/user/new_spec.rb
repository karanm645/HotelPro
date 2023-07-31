require 'rails_helper'

RSpec.describe "User Form" do 
  describe 'when user clicks the signup button' do 
    it 'will take them to the form' do
      visit "/"

      click_link('Sign Up')

      visit "/signup"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: 'abcd')
      fill_in('Password confirmation', with: 'abcd')

      click_button("Create Account")
    end 
  end 
end 