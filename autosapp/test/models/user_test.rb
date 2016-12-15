# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email              :string           not null
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#

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
