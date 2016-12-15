json.extract! location, :id, :name, :street, :city, :state, :zip, :phone, :created_at, :updated_at
json.url location_url(location, format: :json)