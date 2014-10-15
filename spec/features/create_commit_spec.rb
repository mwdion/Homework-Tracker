require 'rails_helper'
describe "create commit", type: :feature, js: true do
  it "should allow user to create commit" do
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
    select('5', :from => 'unit_date_3i')
    click_button 'Add Unit'
    expect(page).to have_content("Location Profile")
    click_link 'Ruby on Rails'
    expect(page).to have_content("Unit Profile")
    click_link 'Add Project'
    expect(page).to have_content("New Project")
    fill_in "project_name", with: "BlackJack Ruby"
    select('2015', :from => 'project_date_1i')
    select('January', :from => 'project_date_2i')
    select('15', :from => 'project_date_3i')
    fill_in "project_description", with: "Create Blackjack. Use numbers 1-11 for cards instead of creating an entire deck! I want to be able to split on double cards and play both hands.  Bonus: create a dealer for the blackjack game. He doesn't have to split."
    fill_in "project_requirements", with: "Ruby"
    click_button "Add Project"
    expect(page).to have_content("Unit Profile")
    click_link "BlackJack Ruby"
    expect(page).to have_content("Project")
    click_link "Make a Commit"
    expect(page).to have_content("New Commit")
    fill_in "transmit_name", with: "BlackJack Project Commit"
    fill_in "transmit_github_link", with: "www.github.com"
    fill_in "transmit_heroku_link", with: "www.heroku.com"
    fill_in "transmit_other_link", with: "www.blackjack.com"
    fill_in "transmit_content", with: "Still has issues with AJAX"
    click_button "Create Transmit"
    expect(page).to have_content("Committed Files")
  end
end