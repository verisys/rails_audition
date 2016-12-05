require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:curtis)
    @location = locations(:morgan)
  end

  test "should be valid" do
    assert @location.valid?
  end
  
  test "name should be present" do
    @location.name = "   "
    assert_not @location.valid?
  end
  
  test "name should be at most 100 characters" do
    @location.name = "a" * 101
    assert_not @location.valid?
  end
  
  test "address should be present" do
    @location.address = "   "
    assert_not @location.valid?
  end
  
  test "address should be at most 100 characters" do
    @location.address = "a" * 101
    assert_not @location.valid?
  end
  
  test "city should be present" do
    @location.city = "   "
    assert_not @location.valid?
  end
  
  test "city should be at most 50 characters" do
    @location.city = "a" * 51
    assert_not @location.valid?
  end
  
  test "state should be present" do
    @location.state = "   "
    assert_not @location.valid?
  end
  
  test "state should be at most 2 characters" do
    @location.state = "a" * 3
    assert_not @location.valid?
  end
  
  test "state should be at least 2 characters" do
    @location.state = "a"
    assert_not @location.valid?
  end
  
  test "zip should be present" do
    @location.zip = "   "
    assert_not @location.valid?
  end
  
  test "zip should be at least 5 characters" do
    @location.zip = "a" * 4
    assert_not @location.valid?
  end
  
  test "zip should be at most 10 characters" do
    @location.zip = "a" * 11
    assert_not @location.valid?
  end
  
  test "order should be alphabetical" do
    assert_equal locations(:davis), Location.first
  end
  
  test "associated vehicles should be destroyed" do
    @location.save
    # the fixtures for :morgan have one vehicle defined, it should be destroyed with :morgan
    assert_difference 'Vehicle.count', -1 do
      @location.destroy
    end
  end
end
