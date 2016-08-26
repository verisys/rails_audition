json.extract! inventory, :id, :year, :make, :model, :price, :location, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)