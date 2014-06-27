require 'spec_helper'

feature "Employee signs up" do
  scenario "happy path" do
    visit '/'
    click_link "Employee Sign In"
    click_link "Sign up"
    fill_in "Email", with: "matt@example.com"
    fill_in "First name", with: "matt"
    fill_in "Last name", with: "smith"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should have_content "Welcome to Hear Me Order!"
  end

  scenario "successfully join an existing restaurant" do
    Restaurant.create(name: "Shake Shack", phone: "1112223333", address: "1234 Main Street")
    visit '/'
    click_link "Employee Sign In"
    click_link "Sign up"
    fill_in "Email", with: "matt@example.com"
    fill_in "First name", with: "matt"
    fill_in "Last name", with: "smith"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should have_content "Welcome to Hear Me Order!"
    select "Shake Shack", from: 'employee_restaurant_id'
    click_button "Join Restaurant"
    page.should have_content "My Restaurant"
  end

  scenario "failed signup because duplicate email" do
    Employee.create(email: "matt@example.com", password: "password", password_confirmation: "password", first_name: "matt", last_name: "smith")
    visit '/'
    click_link "Employee Sign In"
    click_link "Sign up"
    fill_in "Email", with: "matt@example.com"
    fill_in "First name", with: "foo"
    fill_in "Last name", with: "Bar"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should_not have_content "Welcome"
    page.should have_content "Email has already been taken"
    page.should have_error("has already been taken", on: "Email")
  end

  scenario "failed signup because password does not match confirm password" do
    Employee.create(email: "matt@example.com", password: "password", password_confirmation: "password", first_name: "matt", last_name: "smith")
    visit '/'
    click_link "Employee Sign In"
    click_link "Sign up"
    fill_in "Email", with: "bob@example.com"
    fill_in "First name", with: "foo"
    fill_in "Last name", with: "Bar"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "mypassword"
    # PR 1: Captchas
    click_button "Sign up"
    page.should_not have_content "Welcome"
    page.should have_content "Password confirmation doesn't match Password"
  end
end
