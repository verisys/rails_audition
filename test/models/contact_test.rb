require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  def Setup
    @contact ||= contacts(:one)
  end
end
