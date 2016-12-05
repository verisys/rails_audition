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

class Location < ApplicationRecord
	has_many :cars, dependent: :destroy

	validates_presence_of :address_line_1, :city, :state, :zip_code
end
