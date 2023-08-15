require 'rails_helper'

RSpec.describe "Edit Property", type: :feature do 
  describe "when I visit the property show page" do 
    it 'has a link to edit the property' do 
      user = User.create(username: "karanm645", password: "123")
      visit "/users/#{user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"

      property1 = user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)

      visit user_property_path(user, property1)

      click_link "Edit"

      visit edit_user_property_path(user, property1)

      fill_in('Name', with: 'Quality Inn')
      fill_in('Street', with: '454 E Jermaine Dupree avenue')
      fill_in('City', with: 'atlanta')
      fill_in('State', with: 'Georgia')
      fill_in('Zip code', with: 65159)
      fill_in('Phone number', with: 7992002893)

      click_button "Update"

      visit user_property_path(user, property1)

      expect(page).to have_content("Quality inn")
    end 
  end 
end 