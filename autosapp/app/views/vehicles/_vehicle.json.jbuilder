json.extract! vehicle, :id, :location_id, :year, :make, :model, :price, :sold, :sale_price, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)