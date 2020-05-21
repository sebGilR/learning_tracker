require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let!(:test_user) { User.create(name: 'Tom', username: 'tom') }

  scenario 'User creates a new session' do
    visit '/login'

    fill_in 'username', with: 'tom'
    click_button 'Log in'

    visit '/sessions/new'

    fill_in 'session_name', with: 'Session'
    fill_in 'session_amount', with: 1
    click_button 'Save'

    visit '/sessions?type=recent'

    expect(page).to have_text('Session')
  end
end
