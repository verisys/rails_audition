json.extract! car_detail, :id, :year, :make, :model, :engine, :color, :created_at, :updated_at
json.url car_detail_url(car_detail, format: :json)