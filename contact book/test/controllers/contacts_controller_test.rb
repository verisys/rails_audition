require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end


  test "index looks correct" do
    get contacts_path
    assert_response :success
    assert_select "h1", "Contacts"
    assert_select "a", "New Contact"
  end


  test "creation page looks correct" do
    get new_contact_path
    assert_response :success
    assert_select "h1", "New Contact Form"
    assert_select "label", 7
    assert_select "input", 9 # Rails adds 2 hidden inputs
    assert_select "label", "Dept name"
  end


  test "creation works properly" do
    name = "Chuck Norris"
    post contacts_path, params: {contact: {contact_name: name}}
    assert Contact.all.count, 1
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "h1", "Contacts"
    assert_select "a", name
  end


  test "editing looks correct" do
    name = "Chuck Norris"
    post contacts_path, params: {contact: {contact_name: name}}
    assert Contact.all.count, 1
    assert_response :redirect
    follow_redirect!
    assert_response :success

    get edit_contact_path(Contact.first)
    assert_response :success
    assert_select "h1", "Edit Contact"
    assert_select "input", name

  end


  test "editing works properly" do
    post contacts_path, params: {contact: {contact_name: "Chuck Norris"}}
    assert Contact.all.count, 1
    assert_response :redirect
    follow_redirect!
    assert_response :success

    new_name = "Bobby Hill"
    patch contact_path(Contact.first), params: {contact: {contact_name: new_name}, id: 1}
    assert Contact.all.count, 1
    assert Contact.first.contact_name, new_name
  end


end
