json.extract! vehicle, :id, :make, :model, :price, :location_id, :mpg, :speed, :status, :color, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)