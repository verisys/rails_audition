require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { active: @contact.active, business_extension: @contact.business_extension, business_phone: @contact.business_phone, emergency_contact_name: @contact.emergency_contact_name, emergency_contact_phone: @contact.emergency_contact_phone, home_phone: @contact.home_phone, name: @contact.name }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    patch :update, id: @contact, contact: { active: @contact.active, business_extension: @contact.business_extension, business_phone: @contact.business_phone, emergency_contact_name: @contact.emergency_contact_name, emergency_contact_phone: @contact.emergency_contact_phone, home_phone: @contact.home_phone, name: @contact.name }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
