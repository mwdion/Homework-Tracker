require 'rails_helper'
describe "create unit", type: :feature, js: true do
  it "should allow user to create unit" do
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
    click_link "Boston, MA"
    expect(page).to have_content("Location Profile")
    click_link 'Add New Unit'
    expect(page).to have_content("New Unit")
    fill_in "unit_name", with: "Ruby on Rails"
    select('2015', :from => 'unit_date_1i')
    select('January', :from => 'unit_date_2i')
    select('January', :from => 'unit_date_2i')
    select('5', :from => 'unit_date_3i')
    click_button 'Add Unit'
    expect(page).to have_content("Location Profile")
  end
end