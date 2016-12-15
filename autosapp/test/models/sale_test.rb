# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  vehicle_id :integer
#  user_id    :integer
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "test_helper"

describe Sale do
  let(:sale) { Sale.new }

  def setup
    @location = FactoryGirl.create(:location)
    @car = Vehicle.create(make: "ford", model: "taurus", price: 12000.00, mpg: '24', speed: '125', status: 'available', color: 'red', location_id: @location.id)
    @salesman = User.create(email: "salesman@dealership.com", password: "password")
    @transaction = Sale.create(vehicle_id: @car.id, user_id: @salesman.id)
  end

  it "must be valid" do
    value(sale).must_be :valid?
  end

  it "must have a vehicle" do
    @transaction.vehicle.must_equal @car
  end

  it "must have a user/salesman" do
    @transaction.user.must_equal @salesman
  end

end
