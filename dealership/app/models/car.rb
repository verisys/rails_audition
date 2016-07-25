# == Schema Information
#
# Table name: cars
#
#  id          :integer          not null, primary key
#  make        :string           not null
#  model       :string           not null
#  price       :integer          not null
#  year        :string
#  mileage     :string
#  sold        :boolean          default(FALSE), not null
#  location_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Car < ApplicationRecord
  belongs_to :location

  validates_presence_of :make, :model, :price, :sold
end
