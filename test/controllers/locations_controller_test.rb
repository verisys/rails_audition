require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should be able to create and list locations" do
    post locations_path, params: {location: {name: 'My Location'}}
    assert_response :redirect
    follow_redirect!
    assert_select "h1", "Location Information"
    assert_select "p", "Location Name - My Location"
    get locations_path
    assert_response :success
    assert_select "h1", "Locations"
    assert_select "th", "Name"
    assert_select "a", "Show"
    assert_select "td", "My Location"
  end
end
