# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

owner_user = User.create(email: "owner@dealership.com", password: "password")
owner_user.add_role(:owner)

inventory_user = User.create(email: "inventory@dealership.com", password: "password")
inventory_user.add_role(:inventory)

sales_user = User.create(email: "sales@dealership.com", password: "password")
sales_user.add_role(:sales)


admin = User.create(email: "admin@dealership.com", password: "password")
admin.add_role(:owner)
admin.add_role(:inventory)
admin.add_role(:sales)