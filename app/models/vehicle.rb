class Vehicle < ApplicationRecord
  belongs_to :location
  
  validates :location_id, presence: true
  validates :make, presence: true, length: { maximum: 50 }
  validates :model, presence: true, length: { maximum: 50 }
  validates :year, presence: true
  validates :color, presence: true, length: { maximum: 50 }
  validates :stock, presence: true, numericality: { greater_than: 0}
  validates :vin, presence: true, length: { maximum: 50 }
  validates :price, numericality: { greater_than: 0}
  validates :sell_price, numericality: true
  validates :mpg_city, numericality: true
  validates :mpg_hwy, numericality: true
end
