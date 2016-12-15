require 'csv'

ActiveRecord::Base.connection.execute("truncate table locations RESTART IDENTITY;")
ActiveRecord::Base.connection.execute("truncate table vehicles RESTART IDENTITY;")
ActiveRecord::Base.connection.execute("truncate table sales RESTART IDENTITY;")
ActiveRecord::Base.connection.execute("truncate table users RESTART IDENTITY;")
ActiveRecord::Base.connection.execute("truncate table roles RESTART IDENTITY;")






owner_user = User.create(email: "owner@dealership.com", password: "password")
owner_user.add_role :owner

inventory_user = User.create(email: "inventory@dealership.com", password: "password")
inventory_user.add_role(:inventory)

sales_user1 = User.create(email: "sales1@dealership.com", password: "password")
sales_user1.add_role(:sales)

sales_user2 = User.create(email: "sales2@dealership.com", password: "password")
sales_user2.add_role(:sales)
sales_user2.remove_role(:inventory)

admin_user = User.create(email: "admin@dealership.com", password: "password")
admin_user.add_role(:admin)
admin_user.remove_role(:inventory)
admin_user.remove_role(:sales)
admin_user.remove_role(:owner)






loc1 = Location.create(name: "Downtown Auto Dealer", street: "123 Main Street", city: "Ogden", state: "UT",
                       zip: "12345", phone: "123 456 9900")

loc2 = Location.create(name: "UpTown Auto Dealer", street: "945 River Road", city: "Sandy", state: "UT",
                       zip: "54321", phone: "321 564 1223")

loc3 = Location.create(name: "Western Auto Dealer", street: "2355 South Road", city: "Moab", state: "UT",
                       zip: "84555", phone: "980 456 9900")

data_path = 'lib/data/'

fname = 'vehicles.csv'

CSV.foreach(data_path + fname, {:headers => :first_row}) do |row|
  if row.blank? || (!row[0].nil? && row[0][0] == "#")
    next
  end

  # iterate rows
  hash = row.to_hash

  vehicle = Vehicle.create(make: hash['make'],
                           model: hash['model'],
                           year: hash['year'],
                           price: hash['price'],
                           location_id: hash['location_id'],
                           mpg: hash['mpg'],
                           speed: hash['speed'],
                           status: hash['status'],
                           color: hash['color'])
end


# TODO load some sales