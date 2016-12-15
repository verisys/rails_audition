# == Schema Information
#
# Table name: contacts
#
#  id                :integer          not null, primary key
#  dept              :string
#  name              :string
#  business_phone    :string
#  business_ext      :string
#  home_phone        :string
#  emergency_contact :string
#  emergency_number  :string
#  is_active         :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_url
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { business_ext: @contact.business_ext, business_phone: @contact.business_phone,
                                              dept: @contact.dept, emergency_contact: @contact.emergency_contact,
                                              emergency_number: @contact.emergency_number, home_phone: @contact.home_phone,
                                              is_active: @contact.is_active, name: @contact.name } }
    end

    assert_redirected_to "/contacts"
  end

  test "should show contact" do
    get contact_url(@contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_url(@contact)
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { business_ext: @contact.business_ext,
                                                      business_phone: @contact.business_phone,
                                                      dept: @contact.dept, emergency_contact: @contact.emergency_contact,
                                                      emergency_number: @contact.emergency_number,
                                                      home_phone: @contact.home_phone, is_active: @contact.is_active,
                                                      name: @contact.name } }
    assert_redirected_to contact_url(@contact)
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact)
    end

    assert_redirected_to contacts_url
  end
end
