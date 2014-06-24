require 'spec_helper'

feature "Add A Menu Item" do
  scenario "happy path" do
    visit '/'
    click_link "Register As Employee"
    fill_in "Email", with: "matt@example.com"
    fill_in "First name", with: "matt"
    fill_in "Last name", with: "smith"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should have_content "Welcome to Hear Me Order!"

    click_link "Add A Restaurant"
    fill_in "Name", with: "Burger Shack"
    fill_in "Address", with: "1234 Main Street"
    fill_in "Phone", with: "1234567890"
    click_button "Add Restaurant"
    page.should have_content "Burger Shack Added and matt is a member"

    #auto redirect to restaurant show page

    page.should have_content "smith, matt"
    page.should have_content "Burger Shack"

    click_button "Add A Menu Item"
    fill_in "Name", with: "Cheeseburger"
    fill_in "Price", with: 9.85
    fill_in "Description", with: "Half pound of juicy goodness"
    click_button "Add Menu Item"
    page.should have_content "Cheeseburger added"
    page.should have_content "Burger Shack"
  end

  scenario "Item not created due to invalid item entered" do
    visit '/'
    click_link "Register As Employee"
    fill_in "Email", with: "matt@example.com"
    fill_in "First name", with: "matt"
    fill_in "Last name", with: "smith"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should have_content "Welcome to Hear Me Order!"

    click_link "Add A Restaurant"
    fill_in "Name", with: "Burger Shack"
    fill_in "Address", with: "1234 Main Street"
    fill_in "Phone", with: "1234567890"
    click_button "Add Restaurant"
    page.should have_content "Burger Shack Added and matt is a member"

    #auto redirect to restaurant show page

    page.should have_content "smith, matt"
    page.should have_content "Burger Shack"

    click_button "Add A Menu Item"
    fill_in "Name", with: "Cheeseburger"
    fill_in "Price", with: -9.85
    fill_in "Description", with: "Half pound of goodness"
    click_button "Add Menu Item"
    page.should have_content "Cheeseburger couldn't be added"
  end
end
