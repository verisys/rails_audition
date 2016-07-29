# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts " "
puts "**** Create A few users *****"
owner = User.create(name: 'User1',
                    email: 'user1@email.com',
                    owner: true,
                    position: 'Salesman',
                    password: 'password',
                    password_confirmation: 'password')

inventory_manager = User.create(name: 'User2',
                    email: 'user2@email.com',
                    owner: false,
                    position: 'Inventory Manager',
                    password: 'password',
                    password_confirmation: 'password')

sales_man = User.create(name: 'User3',
                        email: 'user3@email.com',
                        owner: false,
                        position: 'Salesman',
                        password: 'password',
                        password_confirmation: 'password')
puts "**** **** *****"
puts "**** User Created ****"
puts "#{owner.name}, #{owner.email}"
puts " "
puts "**** User Created ****"
puts "#{inventory_manager.name}, #{inventory_manager.email}"
puts " "
puts "**** User Created ****"
puts "#{sales_man.name}, #{sales_man.email}"
puts " "
puts "**** **** *****"

puts "**** Create A few Locations *****"
location1 = Location.create(address: '100 Strange Road, Lake Geneva, KS')
location2 = Location.create(address: '90012 Real Lakes Road, Dallas, TX')
puts "****  *** *** *****"
puts " "
puts " "
puts "**** Create A few Vehicles *****"
Vehicle.create(make: 'Ford', model: 'C-Max h', list_price: 20_000, location_id: location1.id, sold: false)
Vehicle.create(make: 'Honda', model: 'Civic', list_price: 22_000, location_id: location1.id, sold: false)
Vehicle.create(make: 'Isuzu', model: 'Tiger', list_price: 25_000, location_id: location2.id, sold: false)
Vehicle.create(make: 'Lexus', model: 'IS 250', list_price: 50_000, location_id: location2.id, sold: false)
Vehicle.create(make: 'Tesla', model: 'Model X', list_price: 140_000, location_id: location2.id, sold: false)
Vehicle.create(make: 'Tesla', model: 'Model 3', list_price: 60_000, location_id: location1.id, sold: false)
Vehicle.create(make: 'Tesla', model: 'Model S', list_price: 120_000, location_id: location1.id, sold: false)
puts "**** *********************** *****"
puts " "