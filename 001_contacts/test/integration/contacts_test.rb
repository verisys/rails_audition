require 'test_helper'

# TO DO test active
# 
class ContactsTest < ActionController::IntegrationTest
  def sorted_field(res, field)
    new_list = res["contacts"].map { | i | i[field]}
    new_list.sort
  end
  def test_list_contacts
    get '/api/v1/contacts'
    res = JSON.parse(@response.body)

    assert_equal 3, res["contacts"].count
    assert_equal sorted_field(res, "name"), ["George Washington", "John Adams", "John Denver"]
    assert_equal sorted_field(res, "dept"), ["Music", "Revolution", "Revolution"]
    assert_equal sorted_field(res, "business_phone"), ["123-456-6789", "456-789-1011", "789-101-1121"]
    assert_equal sorted_field(res, "business_phone_ext"), ["123", "123", "456"]
    assert_equal sorted_field(res, "home_phone"), ["234-567-8910", "567-891-1011", "891-011-1213"]
    assert_equal sorted_field(res, "emerg_contact_name"), ["George Washington", "John Adams", "Neil Diamond"]
    assert_equal sorted_field(res, "emerg_contact_number"), ["345-678-9101", "678-910-1112", "910-111-2134"]
  end
  def test_list_dept
    get '/api/v1/contacts?dept=Music'
    res = JSON.parse(@response.body)

    assert_equal 1, res["contacts"].count
    assert_equal sorted_field(res, "name"), ["John Denver"]
    assert_equal sorted_field(res, "dept"), ["Music"]
    assert_equal sorted_field(res, "business_phone"), ["789-101-1121"]
    assert_equal sorted_field(res, "business_phone_ext"), ["456"]
    assert_equal sorted_field(res, "home_phone"), ["891-011-1213"]
    assert_equal sorted_field(res, "emerg_contact_name"), ["Neil Diamond"]
    assert_equal sorted_field(res, "emerg_contact_number"), ["910-111-2134"]
  end
  def test_add_contact
    assert_difference('Contact.count') do
      post '/api/v1/contacts', :contact => {
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
  def test_add_contact2
    post '/api/v1/contacts', :contact => {
      "name"=>"George Washington2",
      "dept"=>"Sales",
      "business_phone"=>"555-555-5555",
      "business_phone_ext"=>"555",
      "home_phone"=>"555-555-5554",
      "emerg_contact_name"=>"Don Juan",
      "emerg_contact_number"=>"555-555-5553",
      "active"=>true }
    
    get '/api/v1/contacts'
    res = JSON.parse(@response.body)
    assert_equal 4, res["contacts"].count
    assert_equal sorted_field(res, "name"), ["George Washington", "George Washington2", "John Adams", "John Denver"]
    assert_equal sorted_field(res, "dept"), ["Music", "Revolution", "Revolution", "Sales"]
    assert_equal sorted_field(res, "business_phone"), ["123-456-6789", "456-789-1011", "555-555-5555", "789-101-1121"]
    assert_equal sorted_field(res, "business_phone_ext"), ["123", "123", "456", "555"]
    assert_equal sorted_field(res, "home_phone"), ["234-567-8910", "555-555-5554", "567-891-1011", "891-011-1213"]
    assert_equal sorted_field(res, "emerg_contact_name"), ["Don Juan", "George Washington", "John Adams", "Neil Diamond"]
    assert_equal sorted_field(res, "emerg_contact_number"), ["345-678-9101", "555-555-5553", "678-910-1112", "910-111-2134"]
  end
end
