# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  # SQLite
  ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end

@redun = Department.create :name => "Department of Redundancy Department"
@enron = Department.create :name => "Enron Finance Dept"
@dunder = Department.create :name => "Dunder Mifflin Sales"

User.create :username => "Verisys", :password => "Verisys", :role => "Department Supervisor", :department_id => @dunder.id

Contact.create :first_name => "Dwight", :last_name => "Schrute", :business_phone => "801-555-1234", :business_phone_ext => "123", :home_phone => "801-911-0000", :emergency_contact_name => "Tommy Tutone", :emergency_contact_number => "801-867-5309", :active => true, :department_id => @dunder.id
Contact.create :first_name => "Kenneth", :last_name => "Lay", :business_phone => "713-853-6773", :business_phone_ext => "997", :home_phone => "723-853-5313", :emergency_contact_name => "Andrew Fastow", :emergency_contact_number => "1-202-514-2000", :active => true, :department_id => @enron.id
