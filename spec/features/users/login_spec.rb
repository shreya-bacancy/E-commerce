require "rails_helper"

RSpec.feature "Login", :type => :feature do
  let(:user) { create(:user) }

  scenario 'user navigates to the login page and succesfully logs in', js: true do
    user
    visit root_path
    find('div a', text: 'login').click
    find('ul li', text: 'User Login').click
    
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    find('.btn-primary').click
    expect(page).to have_selector('#user-settings')
  end

end