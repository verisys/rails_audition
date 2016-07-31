require 'rails_helper'

RSpec.feature 'Salesman', type: :feature do
  include_context 'login_salesman'

  def create_vehicle
    @vehicle = FactoryGirl.create(:vehicle)
  end

  feature 'Logged in Salesman' do
    scenario 'can see Vehicles link' do
      expect(page).to have_link 'Vehicles'
    end

    feature 'click the Vehicles link' do
      before do
        create_vehicle
        first(:link, 'Vehicles').click
      end

      scenario 'can see vehicle make' do
        expect(page).to have_content(@vehicle.make)
      end

      scenario 'can see vehicle model' do
        expect(page).to have_content(@vehicle.model)
      end

      scenario 'can see vehicle price' do
        expect(page).to have_content(@vehicle.list_price)
      end

      scenario 'can see vehicle location' do
        expect(page).to have_content(@vehicle.location.address)
      end

      scenario 'can see link to show more details about vehicle' do
        expect(page).to have_link("#{@vehicle.make}", href: "/vehicles/#{@vehicle.id}")
      end

      scenario 'can see more details about the vehicle' do
        click_link(@vehicle.make)
        expect(page).to have_content('Description')
      end
    end

    feature 'marks car as sold' do
      before do
        create_vehicle
        first(:link, 'Vehicles').click
      end

      scenario 'can see button to mark as sold' do
        expect(page).to have_button('Mark Sold')
      end

      scenario 'clicks mark car as sold button' do
        click_button('Mark Sold')
        expect(page).to have_content(@vehicle.make)
        expect(page).to have_content(@vehicle.model)
        expect(page).to have_content(@vehicle.list_price)
        expect(page).to have_content(@vehicle.location.address)
        expect(page).to have_content('Description')
        expect(page).to have_field('sale_price')
        expect(page).to have_button('Create Sale')
      end

      scenario 'completes marking the car as sold' do
        click_button('Mark Sold')
        fill_in('sale_price', with: 30000)
        click_button('Create Sale')

        expect(page).to have_content('Sold!')
        expect(Sale.last.user_id).to eq(salesman.id)
        expect(Sale.last.price).to eq(30000)
      end
    end
  end
end
