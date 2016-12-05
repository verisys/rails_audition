require 'rails_helper'

RSpec.feature 'Owner', type: :feature do
  include_context 'login_owner'

  def create_location
    first(:link, 'View Locations').click
    click_link('New Location')
    fill_in 'location_address', with: 'New Test Location'
    click_button('Create Location')
  end

  feature 'Logged in Owner' do
    scenario 'can see Location link' do
      expect(page).to have_link 'View Locations'
    end

    scenario 'click the View Locations link' do
      first(:link, 'View Locations').click
      expect(page).to have_content('Dealership Locations')
    end

    scenario 'Can see the New Locations button' do
      first(:link, 'View Locations').click
      expect(page).to have_link('New Location')
    end

    scenario 'Can create new locations' do
      first(:link, 'View Locations').click
      click_link('New Location')
      expect(page).to have_content('New Location')
      expect(page).to have_content('Address')
      expect(page).to have_field('location[address]')
      expect(page).to have_button('Create Location')
    end

    scenario 'Successfully creates new locations' do
      create_location
      expect(page).to have_content('New Test Location')
    end

    scenario 'Can delete locations' do
      create_location
      new_location = Location.last
      visit locations_path
      expect(page).to have_link('Destroy', :href=>"/locations/#{new_location.id}")
    end
  end

  feature 'Logged in owner deleting location' do
    self.use_transactional_tests = false

    scenario 'action is successfull', js: true do
      create_location
      visit locations_path
      click_link 'Destroy'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content('Location was successfully destroyed.')
    end
  end

end
