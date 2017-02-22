require 'rails_helper'

wait = Selenium::WebDriver::Wait.new(:timeout => 10)

feature 'root path, user not logged in', js: true do
  before(:each) do
    visit root_path
  end

  scenario 'visit root path' do
    expect(page).to have_content('Welcome, please sign up or log in to continue')
  end

  scenario 'Sign Up link exists' do
    expect(page).to have_content('Sign Up')
  end

  scenario 'Log In link exists' do
    expect(page).to have_content('Log In')
  end

end

feature 'other routes, user not logged in', js: true do

  scenario 'visit contacts path' do
    visit '/contacts'
    expect(current_path).to eq(new_user_session_path)
  end

  scenario 'visit contact path' do
    visit '/contacts/1'
    expect(current_path).to eq(new_user_session_path)
  end

end

feature 'user signs up', js: true do

  scenario 'visit sign up path' do
    visit root_path
    first(:link, 'Sign Up').click
  end

  scenario 'fill and submit form' do
    visit root_path
    first(:link, 'Sign Up').click
    fill_in('user[department]', with: 'IT')
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'password')
    fill_in('user[password_confirmation]', with: 'password')
    find("input[name='commit']").click
    expect(page).to have_content('Welcome, test@test.com!')
  end

end

feature 'user logs in', js: true do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  scenario 'visit log in path' do
    visit root_path
    first(:link, 'Log In').click
  end

  scenario 'fill and submit form' do
    visit root_path
    first(:link, 'Log In').click
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: 'password')
    submit_form
    expect(page).to have_content("Welcome, #{@user.email}!")
  end

end

feature 'user updates account', js: true do
  before(:each) do
    @user = FactoryGirl.create(:user)
    visit root_path
    first(:link, 'Log In').click
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: 'password')
    submit_form
    expect(page).to have_content("Welcome, #{@user.email}!")
  end

  scenario 'visit edit account path' do
    click_link('Edit Account')
    expect(page).to have_content("Edit #{@user.email}")
  end

  scenario 'fill and submit form' do
    click_link('Edit Account')
    expect(page).to have_content("Edit #{@user.email}")
    fill_in('user[department]', with: 'Support')
    fill_in('user[current_password]', with: 'password')
    submit_form
    expect(page).to have_content('Your account has been updated successfully.')
  end

end
