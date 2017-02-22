require 'test_helper'

class SharedControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get shared_home_url
    assert_response :success
  end

end
