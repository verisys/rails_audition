# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

supervisor_user = User.find_or_create_by(first_name: 'Joe') do |user|
  user.last_name = 'Hawkins'
end

Department.find_or_create_by(name: 'Department 1') do |department|
  department.supervisor = supervisor_user
end

Department.find_or_create_by(name: 'Department 2')
