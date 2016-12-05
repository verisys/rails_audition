require 'rails_helper'

RSpec.describe User, type: :model do
  describe "attribute" do
  	it { should have_one :department }
  end

  describe "validations" do
  	it { should validate_presence_of :name }
  end
end
