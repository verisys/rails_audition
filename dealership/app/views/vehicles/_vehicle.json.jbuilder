json.extract! vehicle, :id, :make, :model, :list_price, :location_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)