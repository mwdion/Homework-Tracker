require 'rails_helper'
describe "user registration", type: :feature, js: true do
  it "should allow user registration" do
    visit root_path
    click_link 'Locations'
    click_link "Sign up"
    fill_in "First name", with: "Harry"
    fill_in "Last name", with: "Potter"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    choose('user_role_campus_director')
    click_button "Sign up"  
    expect(page).to have_content('Dashboard')
    click_link 'New Location'
    expect(page).to have_content('New Location')
    fill_in 'location_location_name', with: 'Boston, MA'
    click_button 'Add Location'
    expect(page).to have_content('Boston, MA')
  end
end