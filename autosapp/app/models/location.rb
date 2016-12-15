# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string
#  street     :string
#  city       :string
#  state      :string
#  zip        :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
  has_many :vehicles
  has_many :sales, :through => :vehicles
end
