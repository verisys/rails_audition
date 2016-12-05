json.array!(@sales) do |sale|
  json.extract! sale, :id, :user_id, :sale_price, :sale_price
  json.url sale_url(sale, format: :json)
end
