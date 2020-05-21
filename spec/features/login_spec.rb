require "rails_helper"

RSpec.feature "Login", :type => :feature do
  let!(:test_user) { User.create(name: "Tom", username: "tom") }

  scenario "User logs in with existing user" do
    visit "/login"

    fill_in "username", :with => "tom"
    click_button "Log in"

    expect(page).to have_text("Log out")
  end

  scenario "User logs out and returns to home screen" do
    visit "/login"

    fill_in "username", :with => "tom"
    click_button "Log in"
    visit "/logout"

    expect(page).to have_text("Log in")
  end
end