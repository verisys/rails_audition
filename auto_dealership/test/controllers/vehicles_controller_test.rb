require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference('Vehicle.count') do
      post :create, vehicle: { available: @vehicle.available, ext_color: @vehicle.ext_color, int_color: @vehicle.int_color, location_id: @vehicle.location_id, make: @vehicle.make, milage: @vehicle.milage, model: @vehicle.model, price: @vehicle.price, sold_price: @vehicle.sold_price, user_id: @vehicle.user_id, vin: @vehicle.vin, year: @vehicle.year }
    end

    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should show vehicle" do
    get :show, id: @vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle
    assert_response :success
  end

  test "should update vehicle" do
    patch :update, id: @vehicle, vehicle: { available: @vehicle.available, ext_color: @vehicle.ext_color, int_color: @vehicle.int_color, location_id: @vehicle.location_id, make: @vehicle.make, milage: @vehicle.milage, model: @vehicle.model, price: @vehicle.price, sold_price: @vehicle.sold_price, user_id: @vehicle.user_id, vin: @vehicle.vin, year: @vehicle.year }
    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should destroy vehicle" do
    assert_difference('Vehicle.count', -1) do
      delete :destroy, id: @vehicle
    end

    assert_redirected_to vehicles_path
  end
end
