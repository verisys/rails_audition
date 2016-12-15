# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string
#  street     :string
#  city       :string
#  state      :string
#  zip        :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe Location do
  def setup
    @location = FactoryGirl.create(:location)
    @car = Vehicle.create(make: "ford", model: "taurus", price: 12000.00, mpg: '24', speed: '125', status: 'available', color: 'red', location_id: @location.id)
  end


  it "must be valid" do
    value(@location).must_be :valid?
  end

  it "must support a vehicles association" do
    @location.vehicles.first.must_equal @car
  end

  it "must support a sales association" do
    salesman = User.create(email: "salesman@dealership.com", password: "password")
    transaction = Sale.create(vehicle_id: @car.id, user_id: salesman.id)
    @location.sales.first.must_equal transaction
  end


end
