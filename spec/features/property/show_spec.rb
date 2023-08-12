require 'rails_helper'

RSpec.describe "Property Form" do 
  describe 'when user clicks the add property button' do    
    it 'should have a button to show the users properties' do 
      user = User.create(username: "karanm645", password: "123")
      property1 = user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)
      
      visit "/users/#{user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"

      expect(page).to have_link("View Properties")

      click_link "View Properties"

      visit user_properties_path(user)

      expect(page).to have_text("days inn")

      click_link property1.name 

      visit user_property_path(user, property1)
    end 
  end 
end
