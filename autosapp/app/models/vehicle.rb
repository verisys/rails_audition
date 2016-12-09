# == Schema Information
#
# Table name: vehicles
#
#  id          :integer          not null, primary key
#  make        :string
#  model       :string
#  price       :float
#  location_id :integer
#  mpg         :string
#  speed       :string
#  status      :string
#  color       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Vehicle < ApplicationRecord
  belongs_to :location
  has_one :sale
end
