require 'rails_helper'

RSpec.feature "Managers", type: :feature do
  include_context 'login_manager'

  def create_vehicle
    @vehicle = FactoryGirl.create(:vehicle)
  end

  feature 'Logged in Inventory Manager' do
    it_behaves_like "logged in user"

    feature 'can add new vehicles' do
      before do
        first(:link, 'Vehicles').click
      end

      scenario 'can see the link to add New Vehicle' do
        expect(page).to have_link('New Vehicle')
      end

      scenario 'clicks the add new vehicle link' do
        click_link('New Vehicle')
        expect(page).to have_current_path(new_vehicle_path)
        expect(page).to have_field('vehicle_make')
        expect(page).to have_field('vehicle_model')
        expect(page).to have_field('vehicle_list_price')
        expect(page).to have_field('location_id')
        expect(page).to have_button('Create Vehicle')
      end

      scenario 'creates a new vehicle' do
        location = FactoryGirl.create(:location)
        click_link('New Vehicle')
        fill_in('vehicle_make', with: 'Test Make')
        fill_in('vehicle_model', with: 'Test Model')
        fill_in('vehicle_list_price', with: 10000)
        select(location.address, from: 'location_id')
        click_button('Create Vehicle')
        expect(page).to have_content('Vehicle was successfully created.')
        expect(page).to have_content('Test Make')
        expect(page).to have_content('Test Model')
        expect(page).to have_content(10000)
        expect(page).to have_content(location.address)
      end
    end

    feature 'can edit vehicles' do
      before do
        create_vehicle
        first(:link, 'Vehicles').click
      end

      scenario 'can see the link to edit vehicles' do
        expect(page).to have_link('Edit', href: edit_vehicle_path(@vehicle))
      end

      scenario 'clicks the edit link, sees the correct edit page' do
        click_link('Edit')
        expect(page).to have_current_path(edit_vehicle_path(@vehicle))
      end

      scenario 'can successfully edit the vehicle' do
        click_link('Edit')
        fill_in('vehicle_make', with: 'Updated Make')
        fill_in('vehicle_model', with: 'Updated Model')
        click_button('Update Vehicle')
        expect(page).to have_content('Vehicle was successfully updated.')
      end

      scenario 'can see the updated vehicle information' do
        click_link('Edit')
        fill_in('vehicle_make', with: 'Updated Make')
        fill_in('vehicle_model', with: 'Updated Model')
        click_button('Update Vehicle')
        visit vehicles_path
        expect(page).to have_content('Updated Make')
        expect(page).to have_content('Updated Model')
      end
    end
  end
end
