require 'spec_helper'

feature "User signs up" do
  scenario "happy path" do
    visit '/'
    click_link "Register"
    fill_in "Email", with: "matt@example.com"
    fill_in "First name", with: "matt"
    fill_in "Last name", with: "smith"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should have_content "Welcome to Hear Me Order!"

    click_link "Sign Out"
    click_link "User Sign In"
    fill_in "Email", with: "matt@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content "You have signed in successfully"
  end

  scenario "failed signup because duplicate email" do
    User.create(email: "matt@example.com", password: "password", password_confirmation: "password", first_name: "matt", last_name: "smith")
    visit '/'
    click_link "Register"
    fill_in "Email", with: "matt@example.com"
    fill_in "First name", with: "foo"
    fill_in "Last name", with: "Bar"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should_not have_content "Welcome"
    page.should have_content "Your account could not be created."
    page.should have_error("has already been taken", on: "Email")
  end

  scenario "failed signup because password does not match confirm password" do
    User.create(email: "matt@example.com", password: "password", password_confirmation: "password", first_name: "matt", last_name: "smith")
    visit '/'
    click_link "Register"
    fill_in "Email", with: "bob@example.com"
    fill_in "First name", with: "foo"
    fill_in "Last name", with: "Bar"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "mypassword"
    click_button "Sign up"

    page.should_not have_content "Welcome"
    page.should have_content "Your account could not be created."
    page.should have_error("doesn't match", on: "Password")
  end
end
