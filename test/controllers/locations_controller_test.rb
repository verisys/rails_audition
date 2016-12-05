require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @location = locations(:morgan)
  end
  
  # add owner auth to tests
  test "should redirect create when not logged in" do
    assert_no_difference 'Location.count' do
      post locations_path, params: { location: { name: "Dealership", address: "1234 Anywhere", city: "Anytown", state: "UT", zip: "80000" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Location.count' do
      delete location_path(@location)
    end
    assert_redirected_to login_url
  end

end
