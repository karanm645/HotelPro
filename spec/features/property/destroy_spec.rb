require 'rails_helper'

RSpec.describe "Delete Property", type: :feature do 
  describe "when i visit the properties show page" do 
    it 'has a button to delete the property' do 
      user = User.create(username: "karanm645", password: "123")
      visit "/users/#{user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"

      property1 = user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)

      visit user_property_path(user, property1)

      expect(page).to have_content("Days inn")

      click_button "Delete"

      expect(page).to_not have_content("days inn")
    end 
  end 
end 