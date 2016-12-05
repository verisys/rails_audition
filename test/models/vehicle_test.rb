require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  
  def setup
    @location = locations(:morgan)
    @vehicle = vehicles(:charger)
  end
  
  test "should be valid" do
    assert @vehicle.valid?
  end

  test "location id should be present" do
    @vehicle.location_id = nil
    assert_not @vehicle.valid?
  end

  test "make should be present" do
    @vehicle.make = "   "
    assert_not @vehicle.valid?
  end

  test "make should be at most 50 characters" do
    @vehicle.make = "a" * 51
    assert_not @vehicle.valid?
  end
  
  test "model should be present" do
    @vehicle.model = "   "
    assert_not @vehicle.valid?
  end

  test "model should be at most 50 characters" do
    @vehicle.model = "a" * 51
    assert_not @vehicle.valid?
  end
  
  test "color should be present" do
    @vehicle.color = "   "
    assert_not @vehicle.valid?
  end

  test "color should be at most 50 characters" do
    @vehicle.color = "a" * 51
    assert_not @vehicle.valid?
  end
  
  test "stock should be nonzero" do
    @vehicle.stock = 0
    assert_not @vehicle.valid?
  end

  test "vin should be present" do
    @vehicle.vin = "   "
    assert_not @vehicle.valid?
  end

  test "vin should be at most 50 characters" do
    @vehicle.vin = "a" * 51
    assert_not @vehicle.valid?
  end
  
  test "price should be nonzero" do
    @vehicle.price = 0
    assert_not @vehicle.valid?
  end

end
