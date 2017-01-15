class Location < ApplicationRecord
  has_many :cars
  has_many :employees
end
