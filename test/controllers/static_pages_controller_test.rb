require 'test_helper'
require_relative '../../lib/auto_dealership'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  attr_reader :appl
  
  def setup
    @appl = AutoDealership::App.new()
  end
  
  def base_title
    appl.name
  end
    
  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", "#{base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{base_title}"
  end

end
