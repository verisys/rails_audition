json.extract! location, :id, :location_name, :address, :state, :zip, :created_at, :updated_at
json.url location_url(location, format: :json)