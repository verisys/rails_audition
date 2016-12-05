require 'rails_helper'

RSpec.describe Location, type: :model do
  context 'Locations can be created' do
    it 'without address' do
      location = Location.create!
      expect(Location.all.count).to eq(1)
    end

    it 'with address' do
      location = FactoryGirl.create(:location)
      expect(Location.all.count).to eq(1)
      expect(Location.last.address).to eq(location.address)
    end
  end
end
