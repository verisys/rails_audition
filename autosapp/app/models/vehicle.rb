class Vehicle < ApplicationRecord
  belongs_to :location

  validates_presence_of :location_id, :price, :year, :make, :model

end
