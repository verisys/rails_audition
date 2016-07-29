require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @owner = users(:owner)
    @manager = users(:manager)
    @sales = users(:sales)
    @vehicle = vehicles(:charger)
    @another_vehicle = vehicles(:mustang)
  end

  
  test "should redirect new when not logged in" do
    get new_vehicle_path
    assert_redirected_to login_url
  end
  
  test "should redirect edit when not logged in" do
    get edit_vehicle_path(@vehicle)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect sell when not logged in" do
    get sell_vehicle_path(@vehicle)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch vehicle_path(@vehicle), params: { vehicle: { make: @vehicle.make,
                                            model: @vehicle.model } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect edit when not logged in as manager" do
    log_in_as(@manager)
    get edit_vehicle_path(@vehicle)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect sell when not logged in as sales" do
    log_in_as(@sales)
    get sell_vehicle_path(@vehicle)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy when not logged in as manager" do
    assert_no_difference 'Vehicle.count' do
      delete vehicle_path(@vehicle)
    end
    assert_redirected_to login_url
  end

end
