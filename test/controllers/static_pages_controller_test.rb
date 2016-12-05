require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get the home page" do
    get static_pages_home_path
    assert_response :success
  end
end
