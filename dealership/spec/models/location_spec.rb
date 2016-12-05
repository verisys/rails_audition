# == Schema Information
#
# Table name: locations
#
#  id             :integer          not null, primary key
#  address_line_1 :string           not null
#  address_line_2 :string
#  city           :string           not null
#  state          :string           not null
#  zip_code       :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Location, type: :model do
	describe "attributes" do
		it { should have_many :cars }
	end

	describe "validations" do
		it { should validate_presence_of :address_line_1 }
		it { should validate_presence_of :city }
		it { should validate_presence_of :state }
		it { should validate_presence_of :state }
		it { should validate_presence_of :zip_code }
	end
end
