class Vehicle < ApplicationRecord
  belongs_to :location
  belongs_to :salesman, class_name: "User", foreign_key: "salesman_user_id"

  validates_presence_of :location_id, :price, :year, :make, :model

end
