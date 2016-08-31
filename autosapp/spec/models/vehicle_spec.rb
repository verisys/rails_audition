require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it "is valid with location_id, price, year, make, model" do
    location = Location.create(name: "My Location")
    vehicle = Vehicle.create(location_id: location.id, price: 12999, year: "2007", make: "Chevy", model: "Cobalt")

    expect(vehicle).to be_valid
  end

  it "is invalid without a location" do
    Vehicle.create(location_id: nil, price: 12999, year: "2007", make: "Chevy", model: "Cobalt")

    expect(Vehicle.count).to eq(0)
  end

  it "is invalid without a price" do
    location = Location.create(name: "My Location")
    Vehicle.create(location_id: location.id, price: nil, year: "2007", make: "Chevy", model: "Cobalt")

    expect(Vehicle.count).to eq(0)
  end

  it "is invalid without a year" do
    location = Location.create(name: "My Location")
    Vehicle.create(location_id: location.id, price: 12999, year: nil, make: "Chevy", model: "Cobalt")

    expect(Vehicle.count).to eq(0)
  end

  it "is invalid without a make" do
    location = Location.create(name: "My Location")
    Vehicle.create(location_id: location.id, price: 12999, year: "2007", make: nil, model: "Cobalt")

    expect(Vehicle.count).to eq(0)
  end

  it "is invalid without a model" do
    location = Location.create(name: "My Location")
    Vehicle.create(location_id: location.id, price: 12999, year: "2007", make: "Chevy", model: nil)

    expect(Vehicle.count).to eq(0)
  end
end
