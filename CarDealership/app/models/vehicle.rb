class Vehicle < ActiveRecord::Base
  
  belongs_to :location
  has_one :sale
  
  def vehicle_name
    [year, color, make, model, location.name].compact.join(', ')
  end
  
end
