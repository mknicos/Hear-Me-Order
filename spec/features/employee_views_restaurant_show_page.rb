require 'spec_helper'

feature "Add A Restaurant" do
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
    page.should have_content "Restaurant Added and matt is a member"

    visit restaurant_path
    click_link "Burger Shack"
    page.should have_content "matt smith"
    page.should have_content "Burger Shack"
  end
