require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should be able to create a vehicle" do
    ford = Location.new(name: 'Fordland')
    ford.save
    post vehicles_path params: {vehicle: {make: "Ford", model: "Focus", price: "10000", location_id: ford.id}}
    assert_response :redirect
    follow_redirect!
    assert_select "h1", "Vehicle Details"
    assert_select "p", "Make: Ford"
    assert_select "p", "Model: Focus"
    assert_select "p", "Price: 10000"
    assert_select "p", "Location: Fordland"
    p Vehicle.all
    get vehicles_path
  end
  test "should be able to see a list of vehicles" do
    loc = Location.create(name: 'Myplace')
    puts "Here's a string"
    p loc
    p loc.id
    veh = Vehicle.create(make: "Ford", model: "Focus", price: "9000", location_id: loc.id)
    p veh
    get vehicles_path
    assert_response :success
    assert_select "h1", "Vehicles"
    assert_select "td", "Ford"
    assert_select "td", "Focus"
    assert_select "td", "9000"
    assert_select "td", "Myplace"
    assert_select "a", "Show"
  end
end
