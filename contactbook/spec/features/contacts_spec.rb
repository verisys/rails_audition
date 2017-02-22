require 'rails_helper'

feature 'user visits contacts', js: true do
  before(:each) do
    @support = FactoryGirl.create(:contact, department: 'Support')
    @it = FactoryGirl.create(:contact, department: 'IT')
    @user = FactoryGirl.create(:user)
    visit root_path
    first(:link, 'Log In').click
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: 'password')
    find("input[name='commit']").click
    expect(page).to have_content("Welcome, #{@user.email}!")
  end

  scenario 'click my contacts' do
    first(:link, 'My Contacts').click
    expect(current_path).to eq(contacts_path)
  end

  scenario 'visit my contacts' do
    first(:link, 'My Contacts').click
    expect(page).to have_content("#{@user.email}'s contacts")
  end

  scenario 'contacts are listed' do
    first(:link, 'My Contacts').click
    expect(page).to have_content(@it.name)
  end

  scenario 'visit contact path' do
    first(:link, 'My Contacts').click
    click_link(@it.name)
    expect(current_path).to eq(contact_path(@it))
    expect(page).to have_content(@it.name)
    expect(page).to have_content("Department: #{@it.department}")
  end

  scenario 'select another department' do
    select('Support', from: 'department')
    submit_form
    expect(page).to have_content("Support's contacts")
    expect(current_path).to eq(department_path(department: 'Support'))
  end

  scenario 'visit another department' do
    select('Support', from: 'department')
    submit_form
    expect(page).to have_content("Support's contacts")
  end

  scenario 'contacts are listed' do
    select('Support', from: 'department')
    submit_form
    expect(page).to have_content("Support's contacts")
    expect(page).to have_content(@support.name)
  end

end

feature 'create contact', js: true do
  before(:each) do
    @user = FactoryGirl.create(:user)
    visit root_path
    first(:link, 'Log In').click
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: 'password')
    find("input[name='commit']").click
    expect(page).to have_content("Welcome, #{@user.email}!")
  end

  scenario 'visit new contact path' do
    first(:link, 'My Contact').click
    click_link('Add Contact')
    expect(page).to have_content('Add Contact')
  end

  scenario 'fill and submit form' do
    first(:link, 'My Contact').click
    click_link('Add Contact')
    expect(page).to have_content('Add Contact')
    fill_in('contact[name]', with: 'Steve Bobs')
    fill_in('contact[business_phone]', with: '5551234567')
    fill_in('contact[extension]', with: '123')
    fill_in('contact[home_phone]', with: '5551234568')
    fill_in('contact[emergency_contact_name]', with: 'Sue Bobs')
    fill_in('contact[emergency_contact_phone]', with: '5551234569')
    submit_form
    expect(page).to have_content("Contact Steve Bobs Saved")
    expect(page).to have_content("Department: IT")
  end
end

feature 'edit contact', js: true do
  before(:each) do
    @user = FactoryGirl.create(:user)
    visit root_path
    first(:link, 'Log In').click
    fill_in('user[email]', with: @user.email)
    fill_in('user[password]', with: 'password')
    find("input[name='commit']").click
    expect(page).to have_content("Welcome, #{@user.email}!")
    first(:link, 'My Contact').click
    click_link('Add Contact')
    expect(page).to have_content('Add Contact')
    fill_in('contact[name]', with: 'Steve Bobs')
    fill_in('contact[business_phone]', with: '5551234567')
    fill_in('contact[extension]', with: '123')
    fill_in('contact[home_phone]', with: '5551234568')
    fill_in('contact[emergency_contact_name]', with: 'Sue Bobs')
    fill_in('contact[emergency_contact_phone]', with: '5551234569')
    submit_form
    expect(page).to have_content("Contact Steve Bobs Saved")
    expect(page).to have_content("Department: IT")
  end

  scenario 'visit edit contact path' do
    click_link('Edit')
    expect(page).to have_content('Edit Contact Steve Bobs')
  end

  scenario 'fill and submit form' do
    click_link('Edit')
    expect(page).to have_content('Edit Contact Steve Bobs')
    fill_in('contact[name]', with: 'Stephen Bobs')
    fill_in('contact[extension]', with: '456')
    submit_form
    expect(page).to have_content('Contact Stephen Bobs Updated')
    expect(page).to have_content('B.Phone: 5551234567 456')
  end

  scenario 'deactivate contact' do
    expect(page).to have_content('Steve Bobs')
    click_link('Deactivate')
    expect(page).to have_content('Deactivated Steve Bobs')
    expect(page).to have_content('Active: No')
  end

  scenario 'reactivate contact' do
    expect(page).to have_content('Steve Bobs')
    click_link('Deactivate')
    expect(page).to have_content('Deactivated Steve Bobs')
    expect(page).to have_content('Active: No')
    click_link('Activate')
    expect(page).to have_content('Steve Bobs')
    expect(page).to have_content('Active: Yes')
  end

  scenario 'delete contact' do
    expect(page).to have_content('Steve Bobs')
    click_link('Delete')
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('Deleted Steve Bobs')
  end

end
