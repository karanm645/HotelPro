require 'rails_helper'

RSpec.describe "Property Form" do 
  describe 'when user clicks the add property button' do 
    it 'will take them to the form' do
      user = User.create(username: "karanm645", password: "123")

      visit "/users/#{user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"
      #allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: user.id } }
      # binding.pry
      expect(page).to have_link("Add Property")

      click_link "Add Property"
      visit "/users/#{user.id}/add_property"

      expect(page).to have_text("Please Enter Your Property Information")

      fill_in('Name', with: 'Days Inn')
      fill_in('Street', with: '111 NJC ave')
      fill_in('City', with: 'Albuquerque')
      fill_in('State', with: 'New Mexico')
      fill_in('Zip code', with: 77963)
      fill_in('Phone number', with: 8706335716)

      click_button("Submit")

      # visit "/users/#{user.id}"
    end 
  end 
end 