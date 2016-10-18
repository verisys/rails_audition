# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |u|

  user = User.where(email: "user#{u+1}@test.com").first_or_create
  user.confirm
  user.reset_password("password", "password")

  (2 + rand(4)).times do |t|
    d = Department.where(name: Faker::Company.name).first_or_create
    d.user = user 
    d.save
    d.contacts.delete_all

    (50 + rand(131)).times do |x|
        d.contacts.create( name: Faker::Name.name, business_phone: Faker::PhoneNumber.phone_number,
                          home_phone: Faker::PhoneNumber.cell_phone, 
                          emergency_contact_name: Faker::Name.name, 
                          emergency_contact_number: Faker::PhoneNumber.cell_phone)
    end
  end
end