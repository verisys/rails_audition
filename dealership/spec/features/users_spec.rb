require 'rails_helper'

RSpec.feature "Users", type: :feature do
  feature 'User Sees the login page' do
    scenario 'user can see login screen' do
      visit root_path
      expect(page).to have_content 'Please Log In'
    end
  end

  feature 'User can login' do
    let(:owner) { FactoryGirl.create(:owner) }
    before do
      visit login_path
    end

    scenario 'user visits the log in page' do
      expect(page).to have_content 'Log in'
    end

    scenario 'user can see the log in link' do
      expect(page).to have_link('Log in')
    end

    scenario 'user clicks the login link' do
      click_link('Log in')
      expect(page).to have_content('Log in')
      expect(page).to have_field('session_email')
      expect(page).to have_field('session_password')
    end

    scenario 'user unsuccsessful log in' do
      click_link('Log in')
      fill_in 'Email', with: owner.email
      fill_in 'Password', with: 'badPassword'
      click_button 'Log in'
      expect(page).to_not have_content("Welcome #{owner.name.capitalize}")
    end

    scenario 'user logs in successfully' do
      click_link('Log in')
      fill_in 'Email', with: owner.email
      fill_in 'Password', with: owner.password
      click_button 'Log in'
      expect(page).to have_content("Welcome #{owner.name.capitalize}")
    end
  end

  feature 'User can logout' do
    let(:owner) { FactoryGirl.create(:owner) }
    before do
      visit login_path
      click_link('Log in')
    end

    scenario 'user can log out' do
      fill_in 'Email', with: owner.email
      fill_in 'Password', with: owner.password
      click_button 'Log in'
      click_link 'Log out'
      expect(page).to have_link('Log in')
    end

  end
end
