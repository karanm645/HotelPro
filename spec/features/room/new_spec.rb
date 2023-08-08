require 'rails_helper'

RSpec.describe "Property Form" do 
  describe 'when user clicks the add property button' do 
    it 'will take them to the form' do
      user = User.create(username: "karanm645", password: "123")
      property1 = user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)

      visit "/users/#{user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"
      #allow_any_instance_of(ActionDispatch::Request).to receive(:session) { { user_id: user.id } }
      # binding.pry
      expect(page).to have_link("View Properties")

      click_link "View Properties"
      visit "/properties"
      
      expect(page).to have_text(property1.name)

      click_link "Add Rooms"

      visit "/add_rooms"

      fill_in('Room type', with: 'King')
      fill_in('Price', with: 59.99)
      check 'Smoking'
      fill_in('Count', with: 20)
      fill_in('Room number', with: 114)


      click_button("Submit")
      visit "/dashboard"
    end 
  end 
end 