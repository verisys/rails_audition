require 'test_helper'

class Api::V1::ContactsControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end
  test "should add one contact" do
    assert_difference('Contact.count') do
      get :add, :contact => {
        "name"=>"George Washington2",
        "dept"=>"Sales",
        "business_phone"=>"555-555-5555",
        "business_phone_ext"=>"555",
        "home_phone"=>"555-555-5554",
        "emerg_contact_name"=>"Don Juan",
        "emerg_contact_number"=>"555-555-5553",
        "active"=>true }
    end
  end
end
