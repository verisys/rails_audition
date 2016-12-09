require "test_helper"

describe User do

  it "can have a sales transaction" do
    salesman = User.create(email: "salesman@dealership.com", password: "password")
    @loc = Location.create(name: 'mytown')
    @car = Vehicle.create(make: "ford", model: "taurus", price: 12000.00, mpg: '24', speed: '125', status: 'available', color: 'red', location_id: @loc.id)
    transaction = Sale.create(vehicle_id: @car.id, user_id: salesman.id)
    @car.sale.must_equal transaction
    salesman.sales.first.must_equal transaction
  end

end
