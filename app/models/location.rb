class Location < ApplicationRecord
  has_many :vehicles, dependent: :destroy
  
  default_scope -> { order(:name) }
  
  validates :name, presence: true, length: { maximum: 100 }
  validates :address, presence: true, length: { maximum: 100 }
  validates :city, presence: true, length: { maximum: 50 }
  validates :state, presence: true, length: { is: 2 }
  validates :zip, presence: true, length: { in: 5..10 }
end
