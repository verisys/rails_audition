require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  test "create_department" do
    department = Department.new
    assert_not_nil department
  end
end
