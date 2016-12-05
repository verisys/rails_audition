require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  attr_reader :appl
  
  def setup
    @appl = AutoDealership::App.new()
  end
  

  test "full title helper" do
    assert_equal full_title,         appl.name
    assert_equal full_title("Help"), "Help | #{appl.name}"
  end
  
end