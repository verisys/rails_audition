User.create!(name:  "Owner",
  email: "owner@autodealership.com",
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true,
  owner: true,
  manager: false,
  salesman: false)

User.create!(name:  "Manager",
  email: "manager@autodealership.com",
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true,
  owner: false,
  manager: true,
  salesman: false)

User.create!(name:  "Sales",
  email: "sales@autodealership.com",
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true,
  owner: false,
  manager: false,
  salesman: true)

morgan = Location.create(name: "Morgan",
  address: "1928 Old Street",
  city: "Morgan",
  state: "UT",
  zip: "84050")

davis = Location.create( name: "Davis",
  address: "1212 Main Street",
  city: "Layton",
  state: "UT",
  zip: "84414")


morgan.vehicles.create!(make: "Dodge",
  model: "Charger",
  year: 2016,
  price: 41999.99,
  mpg_city: 2,
  mpg_hwy: 3,
  color: "Black",
  stock: 12345,
  vin: "1234HFKDFHFIVDSD",
  image_url: "http://www.dodge.com/mediaserver/iris?COSY-EU-100-1713uLDEMTV1r9s%25WBXaBKFmfKSLC9gIQALMc6UhVkmGBfM9IW2VRkr72kRsd9pavwXGXQpMTV1rUhqg6OQCckPquBhkcNR2oospbAn0BWV1dn4d7eMODrV%25AF&&pov=fronthero&width=668&height=386&bkgrnd=&resp=jpg&cut=",
  sell_price: 0)

davis.vehicles.create!(make: "Ford",
  model: "Mustang",
  year: 2016,
  price: 42999.99,
  mpg_city: 4,
  mpg_hwy: 5,
  color: "Yellow",
  stock: 23123,
  vin: "343FDFHIG3434FS",
  image_url: "http://assets.forddirect.fordvehicles.com/assets/2017_Ford_Mustang_J1/BP2/BUILD/BUILD_136B520D-AC3B-4813-7D18-7CAB7D187CAB.png",
  sell_price: 0)