# == Schema Information
#
# Table name: vehicles
#
#  id          :integer          not null, primary key
#  make        :string
#  model       :string
#  price       :float
#  location_id :integer
#  mpg         :string
#  speed       :string
#  status      :string
#  color       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require "test_helper"

describe Vehicle do
  def setup
    @loc = Location.create(name: 'mytown')
    @loc.vehicles << vehicle
  end

  let(:vehicle) { Vehicle.new }

  it "must be valid" do
    value(vehicle).must_be :valid?
  end

  it "must have a location" do
    vehicle.location.must_equal @loc
  end

  it "can have a sales transaction" do
    salesman = User.create(email: "salesman@dealership.com", password: "password")
    transaction = Sale.create(vehicle_id: vehicle.id, user_id: salesman.id)
    vehicle.sale.must_equal transaction
  end
end
