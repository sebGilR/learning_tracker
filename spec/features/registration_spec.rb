require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  scenario 'User creates a new user through form' do
    visit '/signup'

    fill_in 'user_name', with: 'Tom'
    fill_in 'user_username', with: 'tom'
    click_button 'Create user'

    expect(page).to have_text('Log out')
  end
end
