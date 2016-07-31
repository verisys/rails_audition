RSpec.shared_examples 'logged in user' do
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
end