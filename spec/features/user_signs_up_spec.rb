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
    fill_in "Email", with: "@example.com"
    fill_in "First name", with: "foo"
    fill_in "Last name", with: "Bar"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    # PR 1: Captchas
    click_button "Sign up"
    page.should_not have_content "Welcome"
    page.should have_content "Your account could not be created."
    page.should have_error("is invalid", on: "Password")
  end
end