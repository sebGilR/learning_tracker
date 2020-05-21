require "rails_helper"

RSpec.feature "Login", :type => :feature do
  let!(:test_user) { User.create(name: "Tom", username: "tom") }

  scenario "User creates a new group" do
    visit "/login"

    fill_in "username", :with => "tom"
    click_button "Log in"

    visit "/groups/new"

    fill_in "group_name", :with => "Test Group"
    click_button "Create"

    expect(page).to have_text("Test Group")
  end

end