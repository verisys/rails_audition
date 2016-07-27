require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  def setup
    @department ||= departments(:three)
  end

  def test_name
    assert_equal "Support", @department.name
  end

  def test_support_scope
    department = Department.find_by_name('Support').id
    assert_equal department, Department.support
  end

end
