require 'rails_helper'

RSpec.describe "Property Index Page", type: :feature do 
  describe "when I visit the property index page" do
    before(:each) do 
      @user = User.create(username: "karanm645", password: "123")
      visit "/users/#{@user.id}"
      fill_in('Username', with: 'karanm645')
      fill_in('Password', with: '123')
      click_button "Log In"
      @property1 = @user.properties.create!(name: "days inn", street: "111", city: "ABQ", state: "NM", zip_code: 77963, phone_number: 7206335555)
      
      visit user_properties_path(@user)
    end  

    it 'has a list of properties' do 

      expect(page).to have_content("Days inn")
    end 
    it 'has a back button to the user show page' do 
      click_link "Back"
      visit user_path(@user1)
    end 
  end 
end 