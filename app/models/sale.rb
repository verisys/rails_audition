class Sale < ApplicationRecord
  belongs_to :vehicle
  belongs_to :salesman
end
