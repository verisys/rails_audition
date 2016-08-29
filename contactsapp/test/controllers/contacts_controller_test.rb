require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @contact = contacts(:one)
  end


  test "get index" do
    get contacts_url
    assert_response :success
  end


  test "get new contact" do
    get new_contact_url
    assert_response :success
  end


  test "create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { business_phone: @contact.business_phone, name: @contact.name,
                                              department_id: @contact.department_id,
                                              emergency_contact_name: @contact.emergency_contact_name,
                                              emergency_contact_number: @contact.emergency_contact_number,
                                              extension: @contact.extension, home_phone: @contact.home_phone } }
      assert_redirected_to contacts_url
    end
  end


  test "get edit contact" do
    get edit_contact_url(@contact)
    assert_response :success
  end


  test "edit contact" do
    patch contact_url(@contact), params: {contact: {id: @contact.id, business_phone: @contact.business_phone,
                                                    home_phone: @contact.home_phone, name: @contact.name,
                                                    department_id: @contact.department_id,
                                                    emergency_contact_name: @contact.emergency_contact_name,
                                                    emergency_contact_number: @contact.emergency_contact_number,
                                                    extension: @contact.extension, active: @contact.active}}
    assert_redirected_to contacts_url
  end


  test "delete contact" do

    delete contact_url(@contact)
    assert_redirected_to contacts_url
  end

end
