# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  name          :string
#  resource_type :string
#  resource_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require "test_helper"

describe Role do
  let(:role) { Role.new }

  it "must be valid" do
    value(role).must_be :valid?
  end
end
