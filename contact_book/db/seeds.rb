# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
connection = ActiveRecord::Base.connection()

Supervisor.destroy_all
connection.execute("ALTER TABLE supervisors AUTO_INCREMENT = 1;")

Supervisor.create!([{name: 'Shelli Achenbach'},{name: 'Mitchell Opperman'}, {name: 'Yadira Modeste'}, {name: 'Jeff Armbruster'}])

p "Created #{Supervisor.count} Supervisors"

Department.destroy_all
connection.execute("ALTER TABLE departments AUTO_INCREMENT = 1;")


Department.create!([{name: 'HR', supervisor_id: 3},{name: 'IT', supervisor_id: 1}, {name: 'Accounting', supervisor_id:2}, {name: 'Marketing', supervisor_id: 4}])

p "Created #{Department.count} Departments"

Contact.destroy_all
connection.execute("ALTER TABLE contacts AUTO_INCREMENT = 1;")

Contact.create!([
{department_id: 1, 
name: 'Emanuel Marcin', 
business_phone: '(648) 232-6378', 
business_extension: '',
home_phone: '(218) 207-8754',
emergency_contact_name: 'Florence Goldfarb',
emergency_contact_phone: '(363) 641-2406',
active: true},

{department_id: 3, 
name: 'Ivana Schulman', 
business_phone: '(974) 174-5768', 
business_extension: '428',
home_phone: '(454) 267-2059',
emergency_contact_name: 'Matha Medel',
emergency_contact_phone: '(428) 373-0655',
active: true},

{department_id: 4, 
name: 'Porfirio Weldy', 
business_phone: '(717) 583-4105', 
business_extension: '9567',
home_phone: '(540) 337-0016',
emergency_contact_name: 'Marion Billingsley',
emergency_contact_phone: '(170) 945-2387',
active: true},

{department_id: 4, 
name: 'Yung Yetter', 
business_phone: '(341) 674-3820', 
business_extension: '6595',
home_phone: '(869) 281-3602',
emergency_contact_name: 'Vern Sangster',
emergency_contact_phone: '(944) 284-5877',
active: true},

{department_id: 2, 
name: 'Magen Ravenscroft', 
business_phone: '(649) 880-5684', 
business_extension: '2218',
home_phone: '(766) 642-7653',
emergency_contact_name: 'Maggie Abdulla',
emergency_contact_phone: '(589) 923-1501',
active: true},

{department_id: 1, 
name: 'Christian Kram', 
business_phone: '(842) 560-7366', 
business_extension: '',
home_phone: '(709) 589-0146',
emergency_contact_name: 'Dale Kwong',
emergency_contact_phone: '(506) 841-5093',
active: true},

{department_id: 2, 
name: 'Doug Trapani', 
business_phone: '(235) 119-6803', 
business_extension: '4008',
home_phone: '(288) 751-9870',
emergency_contact_name: 'Lorene Delvalle',
emergency_contact_phone: '(263) 839-4100',
active: true},

{department_id: 2, 
name: 'Hannelore Pantaleo', 
business_phone: '(395) 426-9532', 
business_extension: '',
home_phone: '(125) 413-0120',
emergency_contact_name: 'Alessandra Lessley',
emergency_contact_phone: '(400) 431-8885',
active: true},

{department_id: 3, 
name: 'Noble Halladay', 
business_phone: '(215) 979-5172', 
business_extension: '8140',
home_phone: '(320) 841-1651',
emergency_contact_name: 'Craig Cullen',
emergency_contact_phone: '(159) 601-1117',
active: true},

{department_id: 2, 
name: 'Marlana Souder', 
business_phone: '(168) 625-0338', 
business_extension: '8726',
home_phone: '(810) 589-2650',
emergency_contact_name: 'Norris Collard',
emergency_contact_phone: '(530) 330-2924',
active: true}])

p "Created #{Contact.count} Contacts"

