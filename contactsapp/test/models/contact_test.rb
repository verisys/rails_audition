require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  test "create_contact" do
    contact = Contact.new
    assert_not_nil contact
  end

end
