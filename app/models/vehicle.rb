class Vehicle < ApplicationRecord
  has_one :sale, dependent: :destroy
  belongs_to :location
end
