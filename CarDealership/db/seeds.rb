# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  # SQLite
  ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

owner = User.find_or_create_by!(email: "owner@cardealer.com") do |user|
    user.password = "password"
    user.password_confirmation = "password"
    user.owner!
end

manager = User.find_or_create_by!(email: "manager@cardealer.com") do |user|
    user.password = "password"
    user.password_confirmation = "password"
    user.inventory_manager!
end

sales = User.find_or_create_by!(email: "sales@cardealer.com") do |user|
    user.password = "password"
    user.password_confirmation = "password"
    user.salesman!
end

loc_ogden = Location.create :name => "Ogden, UT"
loc_slc = Location.create :name => "Salt Lake City, UT"

Vehicle.create :make => "Chevy", :model => "Corvette", :year => 2015, :color => "Shark Gray", :price => 60000.00, :location_id => loc_ogden.id
Vehicle.create :make => "Chevy", :model => "Tahoe", :year => 2001, :color => "Brown", :price => 1500, :location_id => loc_slc.id
ford = Vehicle.create :make => "Ford", :model => "Expedition", :year => 2003, :color => "Green", :price => 2500, :location_id => loc_ogden.id

Sale.create :user_id => sales.id, :vehicle_id => ford.id, :sale_price => 2500