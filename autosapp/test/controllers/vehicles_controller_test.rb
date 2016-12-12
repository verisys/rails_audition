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

describe VehiclesController do
  let(:vehicle) { vehicles :one }



  # TODO need tests for all routes, no user, owner, sales, inventory users



  # describe "No user logged in" do
  #
  #   it "gets index" do
  #     get vehicles_url
  #     value(response).must_be :success?
  #   end
  #
  #   it "gets new" do
  #     get new_vehicle_url
  #     value(response).must_be :success?
  #   end
  #
  #   it "creates vehicle" do
  #     expect {
  #       post vehicles_url, params: {vehicle: {color: vehicle.color, location_id: vehicle.location_id, make: vehicle.make, model: vehicle.model, mpg: vehicle.mpg, price: vehicle.price, speed: vehicle.speed, status: vehicle.status}}
  #     }.must_change "Vehicle.count"
  #
  #     must_redirect_to vehicle_path(Vehicle.last)
  #   end
  #
  #   it "shows vehicle" do
  #     get vehicle_url(vehicle)
  #     value(response).must_be :success?
  #   end
  #
  #   it "gets edit" do
  #     get edit_vehicle_url(vehicle)
  #     value(response).must_be :success?
  #   end
  #
  #   it "updates vehicle" do
  #     patch vehicle_url(vehicle), params: {vehicle: {color: vehicle.color, location_id: vehicle.location_id, make: vehicle.make, model: vehicle.model, mpg: vehicle.mpg, price: vehicle.price, speed: vehicle.speed, status: vehicle.status}}
  #     must_redirect_to vehicle_path(vehicle)
  #   end
  #
  #   it "destroys vehicle" do
  #     expect {
  #       delete vehicle_url(vehicle)
  #     }.must_change "Vehicle.count", -1
  #
  #     must_redirect_to vehicles_path
  #   end
  # end

end
