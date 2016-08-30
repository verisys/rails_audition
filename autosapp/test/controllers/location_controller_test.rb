require 'test_helper'

class LocationControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test 'get index' do
    get locations_url
    assert_response :success
  end

end
